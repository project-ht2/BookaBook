require 'test_helper'

class TransactionReviewsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get transaction_reviews_create_url
    assert_response :success
  end

end
