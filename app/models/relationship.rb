class Relationship < ApplicationRecord
  belongs_to :user

  validates :follower_id, presence: true
  validates :followee_id, presence: true
end
