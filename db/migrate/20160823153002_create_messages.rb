class CreateMessages < ActiveRecord::Migration[5.0]
  def change
    create_table :messages do |t|
      t.integer :sender_id, index: true, foreign_key: true
      t.integer :receiver_id, index: true, foreign_key: true
      t.string :body

      t.timestamps
    end
  end
end
