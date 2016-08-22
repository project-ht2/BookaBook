class AddNameDowncaseToAuthors < ActiveRecord::Migration[5.0]
  def change
    add_column :authors, :name_downcase, :string
  end
end
