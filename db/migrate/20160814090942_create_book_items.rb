class CreateBookItems < ActiveRecord::Migration[5.0]
  def change
    create_table :book_items do |t|
      t.references :shelf, foreign_key: true
      t.references :book, foreign_key: true
      t.integer :quantity
      t.integer :available_count

      t.timestamps
    end
  end
end
