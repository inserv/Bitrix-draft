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

require 'test_helper'

class AccountTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
