# == Schema Information
#
# Table name: call_times
#
#  id               :integer          not null, primary key
#  phone_number_id  :integer          not null
#  greating_whrs    :string(255)      default(""), not null
#  greating_afthrs  :string(255)      default(""), not null
#  mon_start1       :time
#  mon_stop1        :time
#  tues_start1      :time
#  tues_stop1       :time
#  wed_start1       :time
#  wed_stop1        :time
#  thu_start1       :time
#  thu_stop1        :time
#  fri_start1       :time
#  fri_stop1        :time
#  sat_start1       :time
#  sat_stop1        :time
#  sun_start1       :time
#  sun_stop1        :time
#  default_start1   :time
#  default_stop1    :time
#  default_override :boolean          default(FALSE), not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class CallTime < ActiveRecord::Base
  
  
  attr_accessible :default_override, 
                  :default_start1, 
                  :default_stop1, 
                  :fri_start1, 
                  :fri_stop1, 
                  :mon_start1, 
                  :mon_stop1, 
                  :phone_number_id, 
                  :sat_start1, 
                  :sat_stop1, 
                  :sun_start1, 
                  :sun_stop1, 
                  :thu_start1, 
                  :thu_stop1, 
                  :tues_start1, 
                  :tues_stop1, 
                  :wed_start1, 
                  :wed_stop1,
                  :greating_whrs,
                  :greating_afthrs
  
  belongs_to      :phone_number
  
end
