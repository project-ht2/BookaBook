class HomeController < ApplicationController
  def index
    @books = Book.all.order('updated_at DESC')
    
    @background = "horizontal-wood-background"
    @col_wide = 'col-md-4'
    @book_cover = 'book-cover'
  end
end
