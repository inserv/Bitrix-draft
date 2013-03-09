module ApplicationHelper
  
  def header
    if new_account?
      '/layouts/h_master' 
    else
      '/layouts/h_menu'
    end
  end
  
end
