# == Schema Information
#
# Table name: groups
#
#  id           :integer          not null, primary key
#  account_id   :integer          not null
#  group_name   :string(255)      default(""), not null
#  group_type   :string(255)      default("parallel"), not null
#  ring_timeout :integer          default(30), not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Group < ActiveRecord::Base
  attr_accessible :account_id,
                  :group_name, 
                  :group_type,
                  :ring_timeout
  
  belongs_to      :account
  has_many        :agents
  has_many        :users, :through => :agents
  
end
