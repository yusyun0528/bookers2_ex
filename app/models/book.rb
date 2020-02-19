class Book < ApplicationRecord 
	belongs_to :user
	validates :title, presence: true
	validates :body ,presence: true, length: {maximum: 200}

  has_many :favorites

  def favorited_by?(user)
    Favorite.where(user_id: user.id, book_id: self.id).exists?
  end
end
