# -*- encoding : utf-8 -*-
class CallMenusController < ApplicationController
  
  def create
      if PhoneNumber.find(params[:phone_number_id]).call_menu.blank?
         @cm=CallMenu.new(:phone_number_id => params[:phone_number_id])
         @cm.save
      end
      @cm_id = PhoneNumber.find(params[:phone_number_id]).call_menu.id
      redirect_to edit_account_phone_number_call_menu_path(params[:account_id],params[:phone_number_id], @cm_id)
  end
  
  def edit
    @cm = CallMenu.find(params[:id])
    @groups=current_account.groups    
  end
  
  def update
    @cm = CallMenu.find(params[:id])
    @cm.update_attributes(params[:call_menu])
    redirect_to :action => :edit
  end
  
end
