# -*- encoding : utf-8 -*-
class CallQueuesController < ApplicationController
  
  def create
    @current_phone = PhoneNumber.find(params[:phone_number_id])
    if @current_phone.call_queue.blank?
      @cq=CallQueue.new(:phone_number_id => params[:phone_number_id], :group_id => current_account.groups.first.id)
      @cq.save
    end
    @cq_id = @current_phone.call_queue.id
    redirect_to edit_account_phone_number_call_queue_path(params[:account_id],params[:phone_number_id], @cq_id)
  end
  
  def edit
    @cq=CallQueue.find(params[:id])
    @groups=current_account.groups
    @agents= Group.find(@cq.group.id).agents
  end
  
  def update
    @cq = CallQueue.find(params[:id])
    @cq.update_attributes(params[:call_queue])
    @cq.phone_number.update_attributes(:ivr_enabled => params[:ivr][:ivr_enabled])
    redirect_to :action => :edit
  end
  
end
