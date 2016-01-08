require 'test_helper'

class GrapeTest < ActiveSupport::TestCase
  def one_grape(name: 'Merlot', color: Grape.colors[:white])
    Grape.new(name: name, color: color)
  end

  test "create grape" do
    grape = one_grape
    assert grape.save
    assert Grape.find(grape.id)
  end

  test "grape name required field" do
    assert_required_field one_grape, :name
  end

  test "grape color required field" do
    assert_required_field one_grape, :color
  end

end
