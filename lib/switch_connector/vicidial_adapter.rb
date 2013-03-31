class VicidialAdapter
	ADMIN = 9
	
	def initialize(host, port)
		host = host || '127.0.0.1'
		port = port || 80
	end
	
	 def method_missing(meth, arg)
		if m = /^(create|update|delete)(\w+)$/.match(meth.to_s)
			action = m[1]
			object = m[2]
			if self.respond_to? "convert#{object}"
				puts "#{meth}, #{arg}"
				self.class.send :define_method, meth do |arg|
					self.send("convert#{object}", arg).each do |o|
						o.send "#{action}!"
					end
				end
			end
		else
			super
		end
	end
	
	def convertAccount account
		account_id = preprocess_account_id account.id
		
		campaign = VicidialCampaign.new(
																		:campaign_id => account_id,
																		:campaign_name => account.name
																		);
		user_group = VicidialUserGroup.new(
																		:user_group => account_id,
																		:group_name => account.name,
																		:allowed_campaigns => account_id
																		);
		return [ campaign, user_group ] 
	end
	
	def convertUser user
		if user.level == ADMIN
			return
		end
		
		vuser = VicidialUser.new(
														:user => user.id,
														:full_name => "#{user.first_name} #{user.last_name}",
														:user_group => preprocess_account_id(user.account.id)
														);
		vragent = VicidialRemoteAgent.new(
														:user_start => user.id,
														:conf_exten => user.phone,
														);
		return [ vauser, vragent ]
	end
	
	def convertPhoneNumber phone_number
		did = VicidialInboundDid.new(
																:did_pattern => phone_number.dnid,
																:did_route => (phone_number.ivr_enabled?) ? "CALLMENU"
																																					: "IN_GROUP"
																);
		[ did ]
	end
	
	def convertGroup group
		ingroup = VicidialInboundGroup.new(
							:group_id => group.id,
							:group_name => group.name,
							:next_agent_call => group.group_type == "parallel"	? "ring_all" 
																																	: "inbound_group_rank"
							);
		return [ ingroup ]
	end
	
	def convertCallMenu cm
		cm = VicidialCallMenu.new(
							:menu_id			=> cm.phone_number.id,
							:menu_name		=> cm.phone_number.number.to_s,
							:menu_prompt	=> File.basename(cm.menu_message, ".*")
							);
	end
	
	def convertCallQueue cq
		moh = VicidialMusicOnHold.new(
							:moh_id		=> cq.phone_number.id,
							:moh_name	=> cq.phone_number.number.to_s,
							:filename => File.basename(cq.music_on_hold, ".*")
							);
		ingroup = VicidialInboundGroup.new(
							:group_id	=> cq.group.id,
							:moh_context => moh.moh_id,
							:play_place_in_line => (cq.place.inform.zero?) ? 'N' : 'Y'
							);
		return [ moh, ingroup ]
	end
	
	def convertCallTime ct
		ingroup = VicidialInboundGroup.new(
							:group_id => ct.phone_number.call_queue,
							:welcome_message_filename => File.basename(ct.greeting_whrs, ".*"),
							:after_hours_message_filename => File.basename(ct.greeting_afthrs, ".*")
							);
		call_time = VicidialCallTime.new(
							:call_time_id				=> ct.id,
							:call_time_name			=> ct.phone_number.number.to_s,
							:ct_monday_start		=> ct.mon_start1,
							:ct_monday_stop			=> (ct.mon_stop1 > ct.mon_start1) ? ct.mon_stop1 : ct.mon_stop1 + 2400,
							:ct_tuesday_start		=> ct.tue_start1,
							:ct_tuesday_stop		=> (ct.tue_stop1 > ct.tue_start1) ? ct.tue_stop1 : ct.tue_stop1 + 2400,
							:ct_wednesday_start	=> ct.wed_start1,
							:ct_wednesday_stop	=> (ct.wed_stop1 > ct.wed_start1) ? ct.wed_stop1 : ct.wed_stop1 + 2400,
							:ct_thursday_start	=> ct.thu_start1,
							:ct_thursday_stop		=> (ct.thu_stop1 > ct.thu_start1) ? ct.thu_stop1 : ct.thu_stop1 + 2400,
							:ct_friday_start		=> ct.fri_start1,
							:ct_friday_stop			=> (ct.fri_stop1 > ct.fri_start1) ? ct.fri_stop1 : ct.fri_stop1 + 2400,
							:ct_saturday_start	=> ct.sat_start1,
							:ct_saturday_stop		=> (ct.sat_stop1 > ct.sat_start1) ? ct.sat_stop1 : ct.sat_stop1 + 2400,
							:ct_sunday_start		=> ct.sun_start1,
							:ct_sunday_stop			=> (ct.sun_stop1 > ct.mon_start1) ? ct.sun_stop1 : ct.sun_stop1 + 2400,
							);
		[ ingroup, call_time ]
	end
	
	def convertAgent agent
		vragent = VicidialRemoteAgent.new(
																			:user_start => agent.user.id,
																			:closer_campaigns => agent.user.groups
																			);
		return [ vragent ]
	end
	
	def preprocess_account_id id
		if %r{^\d+$}.match(id)
			sprintf("%08d", id)
		else
			id
		end
	end
	
	class VicidialObject
			
			module HasAttributes
				attr_accessor :attributes
				
				def has_attributes *args
					@attributes = args
					instance_eval { attr_accessor *args }
				end
				
				def self.included base
					base.extend self
				end
			end
			include HasAttributes
			
			def initialize args
				args.each { |k,v|
					instance_variable_set "@#{k}", v if self.class.attributes.member?(k)
				} if args.is_a? Hash
			end

			def to_json
				hash = Hash.new
				self.instance_variables.each do |key|
					hash[key] = self.instance_variable_get key
				end
				{ self.class.name.underscore.to_sym => hash }.to_json
			end

			def create!(object)
				http = Net::HTTP.new(CallServer.config.host, CallServer.config.port)
				req = Net::HTTP::Post.new(
														 "/"+object.class.name.underscore.to_sym, 
														 initheader = {'Content-Type' =>'application/json'})
				req.body = object.to_json
			
				res = http.request(req)
			
				return res.value
			end

			def update!(object)
				http = Net::HTTP.new(CallServer.config.host, CallServer.config.port)
				req = Net::HTTP::Put.new(
																	 "/"+object.class.name.underscore.to_sym+"/"+object.id, 
																	 initheader = {'Content-Type' =>'application/json'})
				req.body = object.to_json
			
				res = http.request(req)
			
				return res.value
			end
				
			def delete!(object)
				http = Net::HTTP.new(CallServer.config.host, CallServer.config.port)
				req = Net::HTTP::Delete.new("/"+object.class.name.underscore.to_sym+"/"+object.id)
				
				res = http.request(req)
			
				return res.value
			end
	end

	class VicidialCallMenu < VicidialObject
		has_attributes :menu_id, :menu_name, :menu_prompt
	end

	class VicidialCallTime < VicidialObject
		has_attributes	:call_time_id, :call_time_name, 
										:ct_monday_start, :st_monday_stop,
										:ct_tuesday_start, :ct_tuesday_stop,
										:ct_wednesday_start, :ct_wednesday_stop, 
										:ct_thursday_start, :ct_thursday_stop,
										:ct_friday_start, :ct_friday_stop,
										:ct_saturday_start, :ct_saturday_stop, 
										:ct_sunday_start, :ct_sunday_stop
	end

	class VicidialCampaign < VicidialObject
		has_attributes :campaign_id, :campaign_name
	end

	class VicidialInboundDid < VicidialObject
		has_attributes :did_pattern, :did_route
	end

	class VicidialInbounGroup < VicidialObject
		has_attributes :group_id, :group_name, :next_agent_call
	end

	class VicidialMusicOnHold < VicidialObject
		has_attributes :moh_id, :moh_name, :filename
	end

	class VicidialMusicOnHoldFiles < VicidialObject
	end

	class VicidialRemopteAgent < VicidialObject
		has_attributes :user_start, :conf_exten, :closer_campaigns
	end

	class VicidialUser < VicidialObject
		has_attributes :user, :user_group, :full_name
	end

	class VicidialUserGroup < VicidialObject
		has_attributes :user_group, :group_name, :allowed_campaigns
	end
end