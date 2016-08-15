class HomeController < ApplicationController
  before_action :set_wooden_background, only: [:index]
  before_action :set_small_book_block, only: [:index]
  
  def index
    @books = Book.all.order('updated_at DESC')
  end
end
