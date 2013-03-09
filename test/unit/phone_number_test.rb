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

require 'test_helper'

class PhoneNumberTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
