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

class User < ActiveRecord::Base
  include SwitchConnector
  attr_accessible :email, 
                  :first_name, 
                  :last_name, 
                  :level, 
                  :login,
                  :password,
                  :password_confirmation,
                  :phone,
                  :account_id 
  
  belongs_to      :account
  has_many        :agents
  has_many        :groups, :through => :agents

  
  phone_regex = /\d{7,11}/
  
  validates :phone,         :presence => true,
                            :format => { :with => phone_regex }
  validates :first_name,    :presence => true
  validates :last_name,     :presence => true

  
  acts_as_authentic do |config|
    config.logged_in_timeout = 15.minutes
    config.validate_email_field = false
    config.validations_scope = :account_id
    config.crypto_provider = Authlogic::CryptoProviders::MD5
  end

end
