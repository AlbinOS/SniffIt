require 'test_helper'
require 'helpers/policies_test_helper'

class ApplicationPolicyTest < ActiveSupport::TestCase
  include PoliciesTestHelper

  def setup
    @user = users(:user_albin)
    @record = wines(:wine_one)
  end

  def teardown
    @user = nil
    @record = nil
  end

  assert_permit_for :user, :record, only: [:show]
  refute_permit_for :user, :record, except: [:show]

end
