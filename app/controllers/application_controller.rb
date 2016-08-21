class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  def set_wooden_background
    @background = "horizontal-wood-background" 
  end
  
  def set_small_book_block
    @col_wide = 'col-md-4'
    @book_cover = 'book-cover'
    @size = 'small'
  end
  
  def set_big_book_block
    @col_wide = 'col-md-12'
    @book_cover = 'big-book-cover'
    @size = 'big'
  end


  

end
