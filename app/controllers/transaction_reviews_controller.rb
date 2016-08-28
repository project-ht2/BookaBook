class TransactionReviewsController < ApplicationController
  def create
    build_review

    respond_to do |format|
      if @review.save
        format.js {}
        format.json {render json: @review, status: :created, location: @review }
      else
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  private
  def review_params
    params.require(:transaction_review).permit(:transaction_id, :reviewer_id, :target_id, :rating, :content)
  end

  def build_review
    @review = TransactionReview.new review_params
  end
end
