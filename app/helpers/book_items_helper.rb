module BookItemsHelper
  def find_book(book_item)
    Book.find(book_item.book_id)
  end
end
