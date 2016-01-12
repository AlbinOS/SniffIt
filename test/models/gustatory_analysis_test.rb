require 'test_helper'
require 'helpers/models/concerns/naturable_test_helper'

class GustatoryAnalysisTest < ActiveSupport::TestCase
  include NaturableTestHelper

  test "build gustatory natures from string" do
    gustatory_analysis = GustatoryAnalysis.new(tasting: Tasting.first)
    build_natures(gustatory_analysis, :gustatory_natures)
  end

  test "get gustatory natures" do
    gustatory_analysis = gustatory_analyses(:gustatory_analysis_one)
    assert_equal 'Amer', gustatory_analysis.natures(:gustatory_natures)
  end
end
