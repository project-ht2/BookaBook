class UserGroup < ApplicationRecord
  has_many :category_groups, class_name: 'CategoryGroup', foreign_key: 'group_id'
  has_many :categories, through: :category_groups

  has_many :book_threads
end
