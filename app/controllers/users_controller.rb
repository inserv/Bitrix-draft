# -*- encoding : utf-8 -*-
class UsersController < ApplicationController
  before_filter :require_login
  before_filter :require_rights

  def new
    @user = User.new
  end
  
  def create
    @user=current_account.users.build(params[:user])
    if @user.save
      redirect_to :action => :index
    else
      render :action => :new
    end
  end
  
  def index
    @users=current_account.users
  end

  def edit
    @user = current_account.users.find(params[:id])
    render :action => :new
  end
  
  def update
     @user = current_account.users.find(params[:id])
     if @user.update_attributes(params[:user])
       if new_account?
         redirect_to new_account_group_path(params[:account_id])
       else
         redirect_to :action => :index
       end
     else
       render :action => :new
     end
  end
  
  def destroy
    @user = current_account.users.find(params[:id])
    @user.destroy
    redirect_to :action => :index
  end

end
