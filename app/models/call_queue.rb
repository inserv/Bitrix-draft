# == Schema Information
#
# Table name: call_queues
#
#  id              :integer          not null, primary key
#  phone_number_id :integer          not null
#  group_id        :integer          not null
#  music_on_hold   :string(255)      default(""), not null
#  place_inform    :boolean          default(FALSE), not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class CallQueue < ActiveRecord::Base
  include SwitchConnector
  attr_accessible :group_id, 
                  :music_on_hold, 
                  :phone_number_id,
                  :place_inform
  
  belongs_to      :phone_number
  belongs_to      :group
  
end
