class CreateTransactionReviews < ActiveRecord::Migration[5.0]
  def change
    create_table :transaction_reviews do |t|
      t.integer :reviewer_id
      t.integer :target_id
      t.integer :rating
      t.text :content

      t.timestamps
    end
  end
end
