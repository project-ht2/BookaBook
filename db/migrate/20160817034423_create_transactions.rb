class CreateTransactions < ActiveRecord::Migration[5.0]
  def change
    create_table :transactions do |t|
      t.references :borrower, foreign_key: true
      t.references :book_item, foreign_key: true
      t.references :transaction_status, foreign_key: true
      t.integer :quantity

      t.timestamps
    end
  end
end
