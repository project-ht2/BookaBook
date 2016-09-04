require 'test_helper'

class BookThreadsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get book_threads_show_url
    assert_response :success
  end

end
