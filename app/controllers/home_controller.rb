class HomeController < ApplicationController
  def index
    @books = Book.all.order('updated_at DESC')
    
    @col_wide = 'col-md-4'
    @book_cover = 'book-cover'
  end
end
