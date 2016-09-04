class CategoryGroup < ApplicationRecord
  belongs_to :category, class_name: 'UserCategory'
  belongs_to :group, class_name: 'UserGroup'
end
