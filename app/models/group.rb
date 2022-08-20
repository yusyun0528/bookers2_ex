class Group < ApplicationRecord
    attachment :image, destroy: false
    has_many :group_users
    has_many :users, through: :group_users
    def owner?(user)
        owner_id == user.id
    end
    
    def member?(user)
        group_users.exists?(user_id: user.id)
        
    end
end
