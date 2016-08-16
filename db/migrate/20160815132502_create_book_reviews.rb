class CreateBookReviews < ActiveRecord::Migration[5.0]
  def change
    create_table :book_reviews do |t|
      t.integer :user_id
      t.integer :book_id
      t.integer :rating
      t.text :content

      t.timestamps
    end
  end
end
