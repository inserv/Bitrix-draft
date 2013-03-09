# == Schema Information
#
# Table name: call_queues
#
#  id              :integer          not null, primary key
#  phone_number_id :integer          not null
#  group_id        :integer          not null
#  music_on_hold   :string(255)      default(""), not null
#  place_inform    :boolean          default(FALSE), not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

require 'test_helper'

class CallQueueTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
