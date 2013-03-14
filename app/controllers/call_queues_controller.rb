# -*- encoding : utf-8 -*-
class CallQueuesController < ApplicationController
   
  def create
    @current_phone = PhoneNumber.find(params[:phone_number_id])
    unless @cq = @current_phone.call_queue
      @cq = CallQueue.create!(:phone_number_id => @current_phone.id, :group_id => current_account.groups.first.id)
    end
     redirect_to :action => :edit
  end
  
  def edit
    @cq=PhoneNumber.find(params[:phone_number_id]).call_queue
    @groups=current_account.groups
    @agents= Group.find(@cq.group.id).agents
  end
  
  def update
    @cq = PhoneNumber.find(params[:phone_number_id]).call_queue
    @cq.update_attributes(params[:call_queue])
    @cq.phone_number.update_attributes(:ivr_enabled => params[:ivr][:ivr_enabled])
    redirect_to :action => :edit
  end
  
end
