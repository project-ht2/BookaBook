class CreateBookThreads < ActiveRecord::Migration[5.0]
  def change
    create_table :book_threads do |t|
      t.string :name
      t.integer :book_id
      t.integer :user_group_id
      t.text :description

      t.timestamps
    end
  end
end
