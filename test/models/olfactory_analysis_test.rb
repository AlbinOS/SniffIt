require 'test_helper'
require 'helpers/models/concerns/naturable_test_helper'

class OlfactoryAnalysisTest < ActiveSupport::TestCase
  include NaturableTestHelper

  test "build olfactory natures from string" do
    assert_all_natures(OlfactoryAnalysis, :olfactory_natures, tasting: Tasting.first)
  end

  test "get retro olfactory natures" do
    assert_all_natures(OlfactoryAnalysis, :retro_olfactory_natures, tasting: Tasting.first)
  end
end
