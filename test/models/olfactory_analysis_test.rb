require 'test_helper'

class OlfactoryAnalysisTest < ActiveSupport::TestCase
  test "build olfactory natures from string" do
    olfactory_analysis = OlfactoryAnalysis.new(tasting: Tasting.first)
    olfactory_analysis.build_natures(:olfactory_natures, 'Odor, Odor2 Odor2, odor3')
    assert olfactory_analysis.save
    assert_equal 3, olfactory_analysis.olfactory_natures.count
    assert_equal 'Odor3', olfactory_analysis.olfactory_natures.last.nature
  end

  test "build retro olfactory natures from string" do
    olfactory_analysis = OlfactoryAnalysis.new(tasting: Tasting.first)
    olfactory_analysis.build_natures(:retro_olfactory_natures, 'Retro-odor, Retro-odor2 Retro-odor2, retro-odor3')
    assert olfactory_analysis.save
    assert_equal 3, olfactory_analysis.retro_olfactory_natures.count
    assert_equal 'Retro-odor3', olfactory_analysis.retro_olfactory_natures.last.nature
  end
end
