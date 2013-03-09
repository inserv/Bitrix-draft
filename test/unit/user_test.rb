# == Schema Information
#
# Table name: users
#
#  id                 :integer          not null, primary key
#  first_name         :string(255)      default(""), not null
#  last_name          :string(255)      default(""), not null
#  email              :string(255)      default(""), not null
#  level              :integer          default(0), not null
#  phone              :string(255)      default(""), not null
#  account_id         :integer          default(0), not null
#  login              :string(255)      not null
#  persistence_token  :string(255)      not null
#  crypted_password   :string(255)      not null
#  password_salt      :string(255)      not null
#  login_count        :integer          default(0), not null
#  failed_login_count :integer          default(0), not null
#  last_request_at    :datetime
#  current_login_at   :datetime
#  last_login_at      :datetime
#  current_login_ip   :string(255)
#  last_login_ip      :string(255)
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
