class GroupUsersController < ApplicationController
  def create
    group_user = GroupUser.new(user_id: current_user.id, group_id: params[:group_id])
    group_user.save
    redirect_to groups_path
  end
  
  def destroy
    group_user = GroupUser.find_by(user_id: current_user.id, group_id: params[:group_id])
    group_user.destroy
    redirect_to groups_path
  end
end
