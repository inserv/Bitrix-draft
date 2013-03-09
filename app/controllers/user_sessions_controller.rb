# -*- encoding : utf-8 -*-
class UserSessionsController < ApplicationController
  layout 'login'
  
  def new
    @user_session = UserSession.new
  end

  def create
    begin
      @current_account = Account.find(params[:account][:id])
      @user_session = @current_account.user_sessions.build(params[:user_session])
      if @user_session.save
        redirect_to account_path(params[:account][:id])
      else
        flash[:error] = "Invalid login"
        render :action => :new
      end
    rescue  ActiveRecord::RecordNotFound
      flash[:error] = "Non-existent account"
      render :action => :new
    end
  end

  def destroy
    current_user_session.destroy
    redirect_to login_path
  end

end