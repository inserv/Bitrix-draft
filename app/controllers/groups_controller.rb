# -*- encoding : utf-8 -*-
class GroupsController < ApplicationController
  before_filter :require_login
  before_filter :require_rights
  
  def new
    @group = Group.new
  end
  
  def index
    @groups=current_account.groups
  end
  
  
  def create
    @user_to_add = params[:user_to_add].delete_if { |i| i == "0"}
    if params[:user_to_add].blank?
      flash[:error] = "Пустая группа! Необходимо добавить пользователей"
      redirect_to :action => :new
    else
      @group = current_account.groups.build(params[:group])
      @group.save
      redirect_to :controller => 'agents', :action => 'new', :group_id => @group.id, :user_to_add => @user_to_add
    end
  end
  
  def edit
    @group = current_account.groups.find(params[:id])
    @agents = @group.agents
  end
  
  def update
    current_account.groups.find(params[:id]).update_attributes(params[:group])
    @user_to_add = params[:user_to_add].delete_if { |i| i == "0"}
    redirect_to :controller => 'agents', :action => 'new', :group_id => params[:id], :user_to_add => @user_to_add  
  end
  
  def destroy
     current_account.groups.find(params[:id]).agents.destroy_all
     current_account.groups.find(params[:id]).destroy
     redirect_to action: 'index'
  end

   
end
