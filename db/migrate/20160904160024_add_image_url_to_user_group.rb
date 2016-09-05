class AddImageUrlToUserGroup < ActiveRecord::Migration[5.0]
  def change
    add_column :user_groups, :image_url, :string
  end
end
