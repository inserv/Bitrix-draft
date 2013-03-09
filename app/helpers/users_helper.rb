# -*- encoding : utf-8 -*-
module UsersHelper
   
   def page_caption
     if @user.new_record?
       "Создание нового пользователя для #{current_account.name}"
     else
       "Редактирование #{@user.login}"
     end
   end
  
end
