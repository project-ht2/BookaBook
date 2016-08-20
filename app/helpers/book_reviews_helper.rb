module BookReviewsHelper
  def find_reviewer_email(book_review)
    User.find(book_review.user_id).email
  end
end
