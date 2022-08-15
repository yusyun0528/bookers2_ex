class Group < ApplicationRecord
    attachment :image, destroy: false
    has_many :group_users
end
