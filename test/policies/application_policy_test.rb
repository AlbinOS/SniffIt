require 'test_helper'
require 'helpers/policies_test_helper'

class TastingPolicyTest < ActiveSupport::TestCase
  include PoliciesTestHelper

  def setup
    @owner = users(:user_albin)
    @not_owner = users(:user_alianaya)
    @tasting = tastings(:tasting_one)
  end

  def teardown
    @owner = nil
    @not_owner = nil
    @tasting = nil
  end

  assert_permit_for :owner, :tasting
  assert_permit_for :not_owner, :tasting, only: [:show, :new, :create]
  refute_permit_for :not_owner, :tasting, only: [:edit, :update, :destroy]

end
