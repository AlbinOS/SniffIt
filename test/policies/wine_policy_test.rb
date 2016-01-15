require 'test_helper'
require 'helpers/policies_test_helper'

class WinePolicyTest < ActiveSupport::TestCase
  include PoliciesTestHelper

  def setup
    @owner = users(:user_albin)
    @not_owner = users(:user_alianaya)
    @wine = wines(:wine_one)
  end

  def teardown
    @owner = nil
    @not_owner = nil
    @wine = nil
  end

  assert_permit_for :owner, :wine
  assert_permit_for :not_owner, :wine, only: [:index, :show, :new, :create]
  refute_permit_for :not_owner, :wine, only: [:edit, :update, :destroy]

end
