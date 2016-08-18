module BooksHelper
  def image_url_replacement(book)
    if book.image_url.blank? 
        "book_image/book_cover.jpg"
    else 
      book.image_url
    end
  end
  
  def book_path_replacement(book)
    if book.respond_to?(:small_image_url)
      "https://www.goodreads.com/book/show/#{book.id}"
    else
      book_path(book)
    end
  end
  
  def description_replacement(book)
    if book.description.nil?
      "Chưa có lời giới thiệu"
    elsif @col_wide == 'col-md-4'
      truncate(book.description, :length => 100, :separator => ' ', :escape => false)
    else
      book.description
    end
  end
  
  def book_id_replacement(book)
    if book.respond_to?(:small_image_url)
      nil
    else
      book.id
    end
  end
  
  def goodreads_id_replacement(book)
    if book.respond_to?(:small_image_url)
      book.id
    else 
      book.goodreads_id
    end
  end
end
