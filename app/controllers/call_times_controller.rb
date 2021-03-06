# -*- encoding : utf-8 -*-
class CallTimesController < ApplicationController
  
  def create
    new_or_edit
  end
  
  def edit
	  new_or_edit   
  end
  
  def show
    new_or_edit
  end
  
  def new_or_edit
	@current_phone = PhoneNumber.find(params[:phone_number_id])
	unless @ct = @current_phone.call_time
		@ct = CallTime.create!(:phone_number_id => @current_phone.id)
	end
	render 'edit'
  end  
  
  def update
    case params[:def_ovr][:default_override]
      when "0" then params[:call_time][:default_override]=false
      when "1" then params[:call_time][:default_override]=true
                    params[:call_time][:default_start1]="00:00"
                    params[:call_time][:default_stop1]="00:00"
      when "2" then params[:call_time][:default_override]=true
                    params[:call_time][:default_start1]="00:01"
                    params[:call_time][:default_stop1]="23:59"
    end
	  @current_phone = PhoneNumber.find(params[:phone_number_id])
    @ct = @current_phone.call_time
    @ct.update_attributes(params[:call_time])
    render 'edit'
  end

end
