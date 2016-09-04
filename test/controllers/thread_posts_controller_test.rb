require 'test_helper'

class ThreadPostsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get thread_posts_create_url
    assert_response :success
  end

end
