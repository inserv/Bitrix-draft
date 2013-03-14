# -*- encoding : utf-8 -*-
class AgentsController < ApplicationController

  def new
    @group = Group.find(params[:group_id])
    if !params[:user_to_add].blank?
      @group.agents.destroy_all
      Agent.new
      params[:user_to_add].each_with_index do |user_id, i|
        @agent = @group.agents.build(:user_id => user_id, :group_priority => i+1)
        @agent.save
      end
    end
    if new_account?
      redirect_to new_account_phone_number_path(current_account.id)
    else
      redirect_to account_groups_path(current_account.id)
    end
  end

end
