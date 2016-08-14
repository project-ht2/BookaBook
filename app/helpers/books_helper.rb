module BooksHelper
  def image_url_replacement(image_url)
      if image_url.blank? 
        "book_image/book_cover.jpg"
      else 
        image_url
      end
  end
end
