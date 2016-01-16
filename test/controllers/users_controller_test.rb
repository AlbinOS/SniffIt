require 'test_helper'
require 'helpers/controllers/authentication_test_helper'
require 'helpers/controllers/authorization_test_helper'

class UsersControllerTest < ActionController::TestCase
  include Devise::TestHelpers
  include AuthenticationTestHelper
  include AuthorizationTestHelper

  authentification_test_for :get, :show, id: 1

  authorization_test_for :get, :show, 'users(:user_alianaya)', id: 'users(:user_albin).id'
end
