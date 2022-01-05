class Favorite < ApplicationRecord
  belongs_to :book
  belongs_to :user
  validates_uniqueness_of :user_id, scope: :book_id
end
