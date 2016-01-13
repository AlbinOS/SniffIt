require 'test_helper'

class WineTest < ActiveSupport::TestCase
  def one_wine(user: User.first, color: 'white', vinification_type: 'normal', appellation: 'appellation', domaine: 'domaine', alcohol_rate: 12, vintage: 2010)
    Wine.new(user: user, color: color, vinification_type: vinification_type, appellation: appellation, domaine: domaine, alcohol_rate: alcohol_rate, vintage: vintage)
  end

  test "create wine" do
    wine = one_wine
    assert wine.save
    assert Wine.find(wine.id)
  end

  test "wine color required field" do
    assert_required_field one_wine, :color
  end

  test "wine appellation required field" do
    assert_required_field one_wine, :appellation
  end

  test "wine domaine required field" do
    assert_required_field one_wine, :domaine
  end

  test "wine user required field" do
    assert_required_field one_wine, :user
  end

  test "wine alcohol_rate required field" do
    assert_required_field one_wine, :alcohol_rate
  end

  test "wine full_name method" do
    assert_equal "appellation, 2010, domaine", one_wine.full_name
  end

  test "wine associations" do
    wine = one_wine
    assert wine.user
    assert wine.tastings
    assert wine.wine_natures
    assert wine.grapes
  end

  test "wine add grapes through wine_natures" do
    wine = one_wine
    wine.grapes = [Grape.first, Grape.second]
    assert wine.save
    assert_equal wine.grapes.count, WineNature.where(wine_id: wine.id).count
    assert_equal wine.grapes.count, Wine.find(wine.id).grapes.count
  end

  test "wine grapes_id method" do
    wine = one_wine
    wine.grapes = [Grape.first, Grape.second]
    assert_equal [Grape.first.id, Grape.second.id], wine.grapes_id
  end

  test "wine grapes_id empty case method" do
    wine = Wine.new
    assert_equal [], wine.grapes_id
  end
end
