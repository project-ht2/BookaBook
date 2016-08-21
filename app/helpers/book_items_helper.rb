module BookItemsHelper
  def find_book(book_item)
    Book.find(book_item.book_id)
  end
  
  def is_book_owner(book_item)
    current_user && book_item.shelf.user.id == current_user.id
  end
    
end
