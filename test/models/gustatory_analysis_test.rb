require 'test_helper'

class GustatoryAnalysisTest < ActiveSupport::TestCase
  test "build gustatory natures from string" do
    gustatory_analysis = GustatoryAnalysis.new(tasting: Tasting.first)
    gustatory_analysis.build_natures(:gustatory_natures, 'Other1, Other2 other2, other3')
    assert gustatory_analysis.save
    assert_equal 3, gustatory_analysis.gustatory_natures.count
    assert_equal 'Other3', gustatory_analysis.gustatory_natures.last.nature
  end
end
