# == Schema Information
#
# Table name: agents
#
#  id             :integer          not null, primary key
#  group_id       :integer          not null
#  user_id        :integer          not null
#  group_priority :integer          default(0), not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class Agent < ActiveRecord::Base
  include SwitchConnector
  include SwitchConnector
  attr_accessible :group_id, 
                  :group_priority, 
                  :user_id
  
  belongs_to      :group
  belongs_to      :user
  
end
