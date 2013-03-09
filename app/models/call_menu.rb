# == Schema Information
#
# Table name: call_menus
#
#  id              :integer          not null, primary key
#  phone_number_id :integer          not null
#  menu_message    :string(255)      default(""), not null
#  menu_key1       :integer          default(0), not null
#  menu_key2       :integer          default(0), not null
#  menu_key3       :integer          default(0), not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class CallMenu < ActiveRecord::Base
  
  attr_accessible :menu_key1, 
                  :menu_key2, 
                  :menu_key3, 
                  :menu_message, 
                  :phone_number_id
  
  belongs_to :phone_number
  
end
