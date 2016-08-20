module BooksHelper
  def image_url_replacement(book)
    if book.nil? || book.image_url.blank? || (book.image_url.include? "assets/nophoto")
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
  
  def modal_replacement(book)
    if book.respond_to?(:small_image_url)
      "goodreads_#{book.id}"
    else
      "internal_#{book.id}"
    end
  end
  
  def author_replacement(book)
    if book.author.respond_to?(:name)
      book.author.name
    else
      if book.authors.author.class == Array
        book.authors.author[0].name
      else
        book.authors.author.name
      end
    end
  end
end
