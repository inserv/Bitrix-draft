# -*- encoding : utf-8 -*-
class GroupsController < ApplicationController
  before_filter :require_login
  before_filter :require_rights
  
  def new
    @group = Group.new
    @users = current_account.users
  end
  
  def index
    @groups=current_account.groups
  end
  
  def create
    if params[:user_to_add].blank?
      flash[:error] = "Пустая группа! Необходимо добавить пользователей"
      redirect_to :action => :new
    end
     @group = current_account.groups.build(params[:group])
     @group.save
     redirect_to :controller => 'agents', :action => 'new', :group_id => @group.id, :user_to_add => params[:user_to_add]
  end
  
  def edit
    @group = current_account.groups.find(params[:id])
    @agents = @group.agents
    @users_id = current_account.users.select(:id).map(&:id) - @agents.select(:user_id).map(&:user_id)
    @users = current_account.users.find(@users_id)
  end
  
  def update
    current_account.groups.find(params[:id]).update_attributes(params[:group])
    redirect_to :controller => 'agents', :action => 'new', :group_id => params[:id], 
                                                           :user_to_del => params[:user_to_del], 
                                                           :user_to_add => params[:user_to_add], 
                                                           :agent => params[:agent] 
  end
  
  def destroy
     current_account.groups.find(params[:id]).agents.destroy_all
     current_account.groups.find(params[:id]).destroy
     redirect_to action: 'index'
  end
  
   
end
