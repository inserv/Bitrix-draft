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

require 'test_helper'

class CallMenuTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
