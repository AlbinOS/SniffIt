require 'test_helper'
require 'helpers/policies_test_helper'

class UserPolicyTest < ActiveSupport::TestCase
  include PoliciesTestHelper

  def setup
    @admin = users(:user_admin)
    @owner = users(:user_albin)
    @not_owner = users(:user_alianaya)
    @user = users(:user_albin)
  end

  def teardown
    @admin = nil
    @owner = nil
    @not_owner = nil
    @user = nil
  end

  assert_permit_for :admin, :user
  assert_permit_for :owner, :user, except: [:index, :create, :new]
  refute_permit_for :not_owner, :user

end
