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

require 'test_helper'

class GroupTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
