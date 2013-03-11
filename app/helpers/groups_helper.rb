# -*- encoding : utf-8 -*-
module GroupsHelper
  
  def selectable_users
    [["пусто",0]] + current_account.users.map {|u| [u.first_name+" "+u.last_name, u.id]}
  end

end
