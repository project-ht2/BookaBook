class BookThread < ApplicationRecord
  belongs_to :book
  belongs_to :group, foreign_key: 'user_group_id', class_name: 'UserGroup'
  has_many :thread_posts
end
