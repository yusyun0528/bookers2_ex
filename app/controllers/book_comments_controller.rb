class BookCommentsController < ApplicationController
  before_action :authenticate_user!
  def create
    @comment = current_user.book_comments.new(comment_params)
    @comment.book_id = params[:book_id]
    @comment.save
    render :create
  end

  def destroy
    @comment = BookComment.find(params[:id])
    if @comment.user_id == current_user.id
      @comment.destroy
    end
    render :destroy
  end

  private
  def comment_params
    params.require(:book_comment).permit(:body)
  end
end
