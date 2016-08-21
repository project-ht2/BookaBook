module BookItemsHelper
  def find_book(book_item)
    Book.find(book_item.book_id)
  end
  
  def is_book_owner(book_item)
    if book_item.shelf.user.id == current_user.id 
      return true
    else
      return false
    end
  end
    
end
