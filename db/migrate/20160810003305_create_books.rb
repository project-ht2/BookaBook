class CreateBooks < ActiveRecord::Migration[5.0]
  def change
    create_table :books do |t|
      t.string :title
      t.references :author, foreign_key: true
      t.references :category, foreign_key: true
      t.decimal :isbn, precision: 13, scale: 0
      t.text :description

      t.timestamps
    end
  end
end
