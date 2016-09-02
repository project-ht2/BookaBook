class UserCategory < ApplicationRecord
  has_many :user_groups, class_name: 'UserGroup'
end
