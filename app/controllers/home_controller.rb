class HomeController < ApplicationController
  def index
    @books = Book.all.order('updated_at DESC')
  end
end
