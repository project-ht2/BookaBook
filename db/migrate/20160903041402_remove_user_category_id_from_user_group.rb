class RemoveUserCategoryIdFromUserGroup < ActiveRecord::Migration[5.0]
  def change
    remove_column :user_groups, :user_category_id, :integer
  end
end
