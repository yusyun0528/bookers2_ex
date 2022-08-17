class Group < ApplicationRecord
    attachment :image, destroy: false
    has_many :group_users
    def owner?(user)
        owner_id == user.id
    end
end
