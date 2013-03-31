require 'switch_connector/vicidial_adapter'

module SwitchConnector
	@@switch_actions = ['create', 'update', 'delete']

	class Config
    attr_accessor :host, :port
  end

  def self.config
    @@config ||= Config.new
  end

  def self.configure
    yield self.config
  end
	
	def self.adapter
		@@adapter ||= VicidialAdapter.new(config.host, config.port)
	end
	
	def self.included base
		@@switch_actions.each do |action|
			base.class_eval do 
				define_method "#{action}_on_switch" do
					SwitchConnector.adapter.send "#{action}#{base}",self
				end
			end
		end
	end
end