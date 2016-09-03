require 'test_helper'

class UserCategoriesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get user_categories_index_url
    assert_response :success
  end

end
