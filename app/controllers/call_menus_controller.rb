# -*- encoding : utf-8 -*-
class CallMenusController < ApplicationController
  
  def create
    @current_phone = PhoneNumber.find(params[:phone_number_id])
    unless @cm = @current_phone.call_menu
      @cm = CallMenu.create!(:phone_number_id => @current_phone.id)
    end
    redirect_to :action => :edit  
  end
  
  def edit
    @cm = PhoneNumber.find(params[:phone_number_id]).call_menu
    @groups=current_account.groups  
  end
  
  def update
    require 'FileUtils'
    if !params[:call_menu][:message_file].blank?
      tmp = params[:call_menu][:message_file].tempfile
      @save_path = File.join("public", "#{params[:account_id]}_"+"#{params[:phone_number_id]}_"+"#{params[:id]}_"+"message.mp3")
      FileUtils.cp tmp.path, @save_path
      params[:call_menu][:menu_message] = @save_path
    end
    @cm = PhoneNumber.find(params[:phone_number_id]).call_menu
    @cm.update_attributes(params[:call_menu].except(:message_file))
    redirect_to :action => :edit
  end
  
end
