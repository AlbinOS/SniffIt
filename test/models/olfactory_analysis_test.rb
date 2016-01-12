require 'test_helper'
require 'helpers/models/concerns/naturable_test_helper'

class OlfactoryAnalysisTest < ActiveSupport::TestCase
  include NaturableTestHelper

  test "build olfactory natures from string" do
    olfactory_analysis = OlfactoryAnalysis.new(tasting: Tasting.first)
    build_natures(olfactory_analysis, :olfactory_natures)
  end

  test "build retro olfactory natures from string" do
    olfactory_analysis = OlfactoryAnalysis.new(tasting: Tasting.first)
    build_natures(olfactory_analysis, :retro_olfactory_natures)
  end

  test "get olfactory natures" do
    olfactory_analysis = olfactory_analyses(:olfactory_analysis_one)
    assert_equal 'Agrumes, Fruits rouges, Fruits noirs', olfactory_analysis.natures(:olfactory_natures)
  end

  test "get retro olfactory natures" do
    olfactory_analysis = olfactory_analyses(:olfactory_analysis_one)
    assert_equal 'Agrumes, Fruits rouges', olfactory_analysis.natures(:retro_olfactory_natures)
  end
end
