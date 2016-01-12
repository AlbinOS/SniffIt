require 'test_helper'
require 'helpers/models/concerns/naturable_test_helper'

class AnalysisConclusionTest < ActiveSupport::TestCase
  include NaturableTestHelper

  test "build dominant gustatory persistences from string" do
    assert_all_natures(AnalysisConclusion, :dominant_gustatory_persistences, tasting: Tasting.first)
  end

  test "build aftertaste persistences from string" do
    assert_all_natures(AnalysisConclusion, :aftertaste_persistences, tasting: Tasting.first)
  end
end
