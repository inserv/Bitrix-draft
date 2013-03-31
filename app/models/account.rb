# == Schema Information
#
# Table name: accounts
#
#  id                :integer          not null, primary key
#  name              :string(255)      not null
#  nat_number_count  :integer          default(1), not null
#  serv_number_count :integer          default(2), not null
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

class Account < ActiveRecord::Base
  include SwitchConnector
   attr_accessible    :name
   
   authenticates_many :user_sessions
   
   has_many           :users
   has_many           :groups
   has_many           :phone_numbers
   
end
