module BooksHelper
  def image_url_replacement(book)
    if book.nil? || book.image_url.blank? || (book.image_url.include? "assets/nophoto")
        "book_image/book_cover.jpg"
    else 
      book.image_url
    end
  end
  
  def description_replacement(book)
    if book.nil? || book.description.nil?
      "..."
    elsif @size == 'small'
      truncate(book.description, :length => 100, :separator => ' ', :escape => false)
    else
      book.description
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