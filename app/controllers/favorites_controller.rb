class FavoritesController < ApplicationController
  before_action :authenticate_user!
  # POST /books/:book_id/favorites
  # POST /favorites.json
  def create
    if !Favorite.where(book_id: params[:book_id], user_id: current_user.id).exists?
      @favorite = current_user.favorites.new(:book_id => params[:book_id])
      @favorite.save
      if request.referer == "https://4b70856de7c344e8bdb275692f0a715d.vfs.cloud9.us-east-1.amazonaws.com/books"
        @books = Book.includes(:favorites).sort {|a,b| b.favorites.size <=> a.favorites.size}
      else
        user_id = request.referer[-1].to_i
        user = User.find_by(id: user_id)
        @books = user.books
      end
    end
  end


  # DELETE /books/:book_id/favorites/
  def destroy
    if Favorite.where(book_id: params[:book_id], user_id: current_user.id).exists?
      @favorite = Favorite.find_by(user_id: current_user, book_id: params[:book_id])
      @favorite.destroy
      if request.referer == "https://4b70856de7c344e8bdb275692f0a715d.vfs.cloud9.us-east-1.amazonaws.com/books"
        @books = Book.includes(:favorites).sort {|a,b| b.favorites.size <=> a.favorites.size}
      else
        user_id = request.referer[-1].to_i
        user = User.find_by(id: user_id)
        @books = user.books
      end
    end
  end
end
