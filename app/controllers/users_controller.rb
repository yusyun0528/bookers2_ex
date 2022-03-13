class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :screen_user, only: [:edit, :update]
  
  def show
    @user = User.find(params[:id])
    @books = @user.books
    @book = Book.new
    today = Date.today
    @today_books = @books.where(created_at: today.in_time_zone.all_day)
    @yesterday_books = @books.where(created_at: (today-1).in_time_zone.all_day)
    @books_tow_days_ago = @books.where(created_at: (today-2).in_time_zone.all_day)
    @books_three_days_ago = @books.where(created_at: (today-3).in_time_zone.all_day)
    @books_four_days_ago = @books.where(created_at: (today-4).in_time_zone.all_day)
    @books_five_days_ago = @books.where(created_at: (today-5).in_time_zone.all_day)
    @books_six_days_ago = @books.where(created_at: (today-6).in_time_zone.all_day)
    @weekly_books = @books.where(created_at: today-6..today+1)
    @last_weekly_books = @books.where(created_at: today-13..today-6)
    if @today_books.exists? && @yesterday_books.exists?
      @yesterday_to_today = (@today_books.count / @yesterday_books.count) *100
    else
      @yesterday_to_today = 0
    end
    if @weekly_books.exists? && @last_weekly_books.exists?
      @last_week_to_this_week = (@weekly_books.count / @last_weekly_books.count) *100 
    else
      @last_week_to_this_week = 0
    end
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

