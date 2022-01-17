class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :screen_user, only: [:edit, :update]
  
  def show
    @user = User.find(params[:id])
    @books = @user.books
    @book = Book.new
  end

  def index
    @users = User.all
    @book = Book.new
  end

  def followings
    @user = User.find(params[:id])
  end

  def followers
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user)
    else
      render 'edit'
    end
    
  end
  
  def direct_massages
    @user = User.find(params[:id])
    unless current_user.following?(@user) and @user.following?(current_user)
      redirect_to request.referer
    end
    
    @massage = DirectMassage.new
    @massages = DirectMassage.where(sender_id: current_user.id, receiver_id: @user.id).or(DirectMassage.where(sender_id: @user.id, receiver_id: current_user.id))
  end

  private
    def user_params
       params.require(:user).permit(:name, :introduction, :profile_image)
    end

    def screen_user
      unless params[:id].to_i == current_user.id
        redirect_to user_path(current_user)
      end
    end

end

