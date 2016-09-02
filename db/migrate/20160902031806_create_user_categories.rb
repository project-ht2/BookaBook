class CreateUserCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :user_categories do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
