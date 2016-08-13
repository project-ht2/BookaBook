require 'test_helper'

class ShelvesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get shelves_new_url
    assert_response :success
  end

end
