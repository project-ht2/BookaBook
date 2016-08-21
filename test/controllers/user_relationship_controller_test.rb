require 'test_helper'

class UserRelationshipControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get user_relationship_create_url
    assert_response :success
  end

end
