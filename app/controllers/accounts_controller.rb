# -*- encoding : utf-8 -*-
class AccountsController < ApplicationController
  
  before_filter :require_login
  before_filter :require_rights

  def show
    if new_account?
       redirect_to edit_account_user_path(params[:id], current_account.users.first.id)
    end
  end

end
