module BookItemsHelper
  def is_book_owner(book_item)
    current_user && book_item.shelf.user.id == current_user.id
  end
end
