require 'test_helper'
require 'helpers/models/concerns/naturable_test_helper'

class AnalysisConclusionTest < ActiveSupport::TestCase
  include NaturableTestHelper

  test "build dominant gustatory persistences from string" do
    analysis_conclusion = AnalysisConclusion.new(tasting: Tasting.first)
    build_natures(analysis_conclusion, :dominant_gustatory_persistences)
  end

  test "build aftertaste persistences from string" do
    analysis_conclusion = AnalysisConclusion.new(tasting: Tasting.first)
    build_natures(analysis_conclusion, :aftertaste_persistences)
  end

  test "get gustatory persistences" do
    analysis_conclusion = analysis_conclusions(:analysis_conclusion_one)
    assert_equal 'Tannin', analysis_conclusion.natures(:dominant_gustatory_persistences)
  end

  test "get aftertaste persistences" do
    analysis_conclusion = analysis_conclusions(:analysis_conclusion_one)
    assert_equal 'Assèchant', analysis_conclusion.natures(:aftertaste_persistences)
  end

end
