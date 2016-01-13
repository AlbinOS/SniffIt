require 'test_helper'

class WelcomeControllerTest < ActionController::TestCase
  include Devise::TestHelpers

  test "logged in should get show" do
    sign_in users(:user_john)
    get :index
    assert_response :success
  end

  test "not authenticated should get show" do
    get :index
    assert_response :success
  end
end
