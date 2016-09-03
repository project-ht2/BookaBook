class AddIsFulfilledToWishlist < ActiveRecord::Migration[5.0]
  def change
    add_column :wishlists, :is_fulfilled, :boolean
  end
end
