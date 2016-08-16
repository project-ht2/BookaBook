class AddTitleDowncaseToBooks < ActiveRecord::Migration[5.0]
  def change
    add_column :books, :title_downcase, :string
  end
end
