class AddNameDowncaseToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :name_downcase, :string
  end
end
