require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  test "should get external_create" do
    get :external_create
    assert_response :success
  end

end
