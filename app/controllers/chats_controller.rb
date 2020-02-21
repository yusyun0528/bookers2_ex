class ChatsController < ApplicationController
  before_action :authenticate_user!
  def show
    @user = User.find(params[:user_id])
    @room = current_user.create_or_find_room_by([params[:user_id]])
  end
end
