# -*- encoding : utf-8 -*-
class ApplicationController < ActionController::Base
  protect_from_forgery
  
  helper_method :current_user_session, 
                :current_user, 
                :current_account,
                :account_numbers,
                :nat_allowed,
                :serv_allowed,
                :new_account?

  protected 
  
  def new_account?
    if account_numbers.blank?
      return true
    else
      return false
    end
  end

  def nat_allowed
    current_account.nat_number_count - account_numbers.where(:number_type => 0).count
  end

  def serv_allowed
    current_account.serv_number_count - account_numbers.where(:number_type => 1).count
  end  

  def account_numbers
    current_account.phone_numbers
  end
  
  def current_user_session
    @current_user_session ||= UserSession.find
  end

  def current_account
     current_user.account
  end

  def current_user
    @current_user ||= current_user_session && current_user_session.user
  end

  def require_login
    unless current_user
      flash[:notice] = "You're not logged in."
      redirect_to login_path
      return false
    end
  end

  def require_rights
    unless current_user.account == current_account
      render :file => "public/401.html", :status => :unauthorized
    end
  end

end