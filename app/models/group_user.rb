class GroupUser < ApplicationRecord
    belongs_to :owner, class_name: 'Group'
    belongs_to :group
end
