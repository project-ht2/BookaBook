require 'test_helper'

class BookReviewsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get book_reviews_create_url
    assert_response :success
  end

end
