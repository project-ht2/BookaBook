class TransactionReviewsController < ApplicationController
  def create
    build_review
    @review.save
  end

  private
  def review_params
    params.require(:transaction_review).permit(:transaction_id, :reviewer_id, :target_id, :rating, :content)
  end

  def build_review
    @review = TransactionReview.new review_params
  end
end
