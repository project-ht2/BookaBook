class BookReviewsController < ApplicationController
  def create
    @book = Book.find(params[:book_id])
    @book_review = @book.book_reviews.create(params[:book_review].permit(:user_id, :rating, :content))
    redirect_to @book
  end
  
  def destroy
    @book = Book.find(params[:book_id])
		@book_review = @book.book_reviews.find(params[:id])
		@book_review.destroy
		redirect_to @book
  end
end
