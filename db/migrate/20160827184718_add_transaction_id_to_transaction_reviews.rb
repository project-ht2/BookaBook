class AddTransactionIdToTransactionReviews < ActiveRecord::Migration[5.0]
  def change
    add_column :transaction_reviews, :transaction_id, :integer
  end
end
