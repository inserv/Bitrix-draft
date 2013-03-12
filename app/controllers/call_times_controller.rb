# -*- encoding : utf-8 -*-
class CallTimesController < ApplicationController
  
  def create
    if PhoneNumber.find(params[:phone_number_id]).call_time.blank?
      @ct = CallTime.new(:phone_number_id => params[:phone_number_id])
      @ct.save
    end
    @ct_id = PhoneNumber.find(params[:phone_number_id]).call_time.id
    redirect_to edit_account_phone_number_call_time_path(params[:account_id],params[:phone_number_id], @ct_id)
  end
  
  def edit
    @ct=CallTime.find(params[:id])   
  end
  
  def update
    @ct = CallTime.find(params[:id])
    @ct.update_attributes(params[:call_time])
    redirect_to :action => :edit
  end

end
