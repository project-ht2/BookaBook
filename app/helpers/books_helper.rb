module BooksHelper
  def image_url_replacement(image_url)
      if image_url.blank? 
        "book_image/book_cover.jpg"
      else 
        image_url
      end
  end
  
  def book_path_replacement(book)
    if book.respond_to?(:small_image_url)
      "#"
    else
      book_path(book)
    end
  end
end
