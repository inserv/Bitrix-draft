# == Schema Information
#
# Table name: call_times
#
#  id               :integer          not null, primary key
#  phone_number_id  :integer          not null
#  greeting_whrs    :string(255)      default(""), not null
#  greeting_afthrs  :string(255)      default(""), not null
#  mon_start1       :time
#  mon_stop1        :time
#  tues_start1      :time
#  tues_stop1       :time
#  wed_start1       :time
#  wed_stop1        :time
#  thu_start1       :time
#  thu_stop1        :time
#  fri_start1       :time
#  fri_stop1        :time
#  sat_start1       :time
#  sat_stop1        :time
#  sun_start1       :time
#  sun_stop1        :time
#  default_start1   :time
#  default_stop1    :time
#  default_override :boolean          default(FALSE), not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

require 'test_helper'

class CallTimeTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
