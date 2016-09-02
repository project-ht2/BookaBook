class CreateUserGroups < ActiveRecord::Migration[5.0]
  def change
    create_table :user_groups do |t|
      t.string :name
      t.text :description
      t.integer :user_category_id

      t.timestamps
    end
  end
end
