class BookReviewsController < ApplicationController
  def create
    @book = Book.find(params[:book_id])
    @book_review = @book.book_reviews.create(params[:book_review].permit(:user_id, :rating, :content))
    redirect_to @book
  end
end
