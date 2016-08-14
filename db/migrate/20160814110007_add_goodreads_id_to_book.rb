class AddGoodreadsIdToBook < ActiveRecord::Migration[5.0]
  def change
    add_column :books, :goodreads_id, :integer
  end
end
