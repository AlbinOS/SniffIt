require 'test_helper'

class WineNatureTest < ActiveSupport::TestCase
  def one_wine_nature(wine: Wine.first, grape: Grape.first)
    WineNature.new(wine: wine, grape: grape)
  end

  test "create wine_nature" do
    wine_nature = one_wine_nature
    assert wine_nature.save
    assert WineNature.find(wine_nature.id)
  end

  test "wine_nature wine required field" do
    assert_required_field one_wine_nature, :wine
  end

  test "wine_nature grape required field" do
    assert_required_field one_wine_nature, :grape
  end

  test "wine_nature associations" do
    wine_nature = one_wine_nature
    assert wine_nature.wine
    assert wine_nature.grape
  end

end
