class CreateAuthors < ActiveRecord::Migration[5.0]
  def change
    create_table :authors do |t|
      t.string :name
      t.string :gender
      t.date :birthday
      t.text :description
      t.string :image_url

      t.timestamps
    end
  end
end
