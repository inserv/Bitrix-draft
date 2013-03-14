# -*- encoding : utf-8 -*-
module CallMenusHelper

  def selectable_groups
    [["выключено",0]] + current_account.groups.map {|g| [g.group_name, g.id]}
  end

end
