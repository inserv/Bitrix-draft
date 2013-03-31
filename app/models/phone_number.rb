# == Schema Information
#
# Table name: phone_numbers
#
#  id          :integer          not null, primary key
#  number      :string(255)      not null
#  number_type :integer          not null
#  account_id  :integer          default(0), not null
#  dnid        :string(255)      default(""), not null
#  ivr_enabled :boolean          default(FALSE), not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class PhoneNumber < ActiveRecord::Base
  include SwitchConnector
  attr_accessible   :number, 
                    :account_id,
                    :ivr_enabled
  
  belongs_to        :account
  has_one           :call_queue
  has_one           :call_time
  has_one           :call_menu
  
  scope :serv_free, -> {where(number_type: 0, account_id: 0)}
  scope :nat_free, -> {where(number_type: 1, account_id: 0)}
  
end
