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

require 'test_helper'

class AgentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
