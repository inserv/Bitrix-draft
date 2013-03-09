# == Schema Information
#
# Table name: user_sessions
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class UserSession < Authlogic::Session::Base
  
  def to_key
    [session_key]
  end
  
end
