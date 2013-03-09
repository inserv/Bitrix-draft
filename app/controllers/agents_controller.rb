# -*- encoding : utf-8 -*-
class AgentsController < ApplicationController

  def new

    if !params[:user_to_add].blank?
      Agent.new
      @group = Group.find(params[:group_id])
      params[:user_to_add].each do |user_id|
        @agent = @group.agents.build(:user_id => user_id)
        @agent.save
      end
    end

    if !params[:agent].blank?
      params[:agent].keys.each do |id|
        Agent.find(id).update_attributes(:group_priority => params[:agent][id])
      end 
    end

    if !params[:user_to_del].blank?
      @group = Group.find(params[:group_id])
      params[:user_to_del].each do |utd|
        @group.agents.where("user_id = ?", utd).destroy_all
      end
    end
    
    if new_account?
      redirect_to new_account_phone_number_path(current_account.id)
    else
      redirect_to account_groups_path(current_account.id)
    end
  end

end
