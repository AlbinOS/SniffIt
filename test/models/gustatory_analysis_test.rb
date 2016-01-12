require 'test_helper'
require 'helpers/models/concerns/naturable_test_helper'

class GustatoryAnalysisTest < ActiveSupport::TestCase
  include NaturableTestHelper

  test "build gustatory natures from string" do
    assert_all_natures(GustatoryAnalysis, :gustatory_natures, tasting: Tasting.first)
  end
end
