# -*- encoding : utf-8 -*-
class PhoneNumbersController < ApplicationController
  before_filter :require_login
  before_filter :require_rights
  
  def new
    if nat_allowed ==0 && serv_allowed==0
      redirect_to action: 'index'
    else
      @nf=PhoneNumber.nat_free
      @sf=PhoneNumber.serv_free
    end
  end

  def create
    @pn_upd_id = params[:nat_id].to_a+params[:serv_id].to_a
    if @pn_upd_id.blank?
      redirect_to :action => :new
    else
      @pn = PhoneNumber.find(@pn_upd_id)
      @pn.each { |pn| pn.update_attributes(:account_id => params[:account_id])}
      redirect_to account_path(params[:account_id])
    end
  end
  
end
