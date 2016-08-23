class BookReviewsController < ApplicationController
  def create
    @book = Book.find(book_review_params[:book_id]) unless book_review_params[:book_id].blank?
    if @book.blank?  
      @book = Book.find_or_create_by(goodreads_id: book_review_params[:goodreads_id])
      @book.update_goodreads_info
    end
    @book_review = @book.book_reviews.create
    @book_review.update(
      user_id: book_review_params[:user_id], 
      rating: book_review_params[:rating],
      content: book_review_params[:content],
      )
    redirect_to @book
  end
  
  def destroy
    @book = Book.find(params[:book_id])
		@book_review = @book.book_reviews.find(params[:id])
		@book_review.destroy
		redirect_to @book
  end

private

  def book_review_params
    params.require(:book_review).permit(:user_id, :rating, :content, :book_id, :goodreads_id)
  end
end
