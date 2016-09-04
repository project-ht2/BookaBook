class UserCategory < ApplicationRecord
  has_many :category_groups, class_name: 'CategoryGroup', foreign_key: 'category_id'
  has_many :groups, through: :category_groups
end
