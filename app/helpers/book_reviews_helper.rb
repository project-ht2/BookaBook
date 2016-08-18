module BookReviewsHelper
  def find_reviewer_email(book_review)
    user = User.find(book_review.user_id)
    user.email
  end
end
