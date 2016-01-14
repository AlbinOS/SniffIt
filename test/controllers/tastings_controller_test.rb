require 'test_helper'
require 'helpers/controllers/authentication_test_helper'
require 'helpers/controllers/authorization_test_helper'

class TastingsControllerTest < ActionController::TestCase
  include Devise::TestHelpers
  include AuthenticationTestHelper
  include AuthorizationTestHelper

  authentification_test_for :get, :show, wine_id:1, id: 1
  authentification_test_for :get, :new, wine_id:1
  authentification_test_for :get, :edit, wine_id:1, id: 1
  authentification_test_for :post, :create, wine_id:1
  authentification_test_for :patch, :update, wine_id:1, id: 1
  authentification_test_for :delete, :destroy, wine_id:1, id: 1

  authorization_test_for :get, :edit, 'users(:user_alianaya)', id: 'tastings(:tasting_albin_one_wine_albin_one).id', wine_id: 'wines(:wine_albin_one).id'
  authorization_test_for :patch, :update, 'users(:user_alianaya)', id: 'tastings(:tasting_albin_one_wine_albin_one).id', wine_id: 'wines(:wine_albin_one).id'
  authorization_test_for :delete, :destroy, 'users(:user_alianaya)', id: 'tastings(:tasting_albin_one_wine_albin_one).id', wine_id: 'wines(:wine_albin_one).id'

  test "should get show" do
    sign_in users(:user_albin)
    tasting = tastings(:tasting_albin_one_wine_albin_one)
    get :show, wine_id: tasting.wine.id, id: tasting.id
    assert_response :success
    assert_equal tasting, assigns(:tasting)
  end

  test "should get new" do
    sign_in users(:user_albin)
    tasting = tastings(:tasting_albin_one_wine_albin_one)
    get :new, wine_id: tasting.wine.id
    assert_response :success
    assert_not_nil assigns(:tasting)
    assert_not_nil assigns(:tasting).visual_analysis
    assert_not_nil assigns(:tasting).olfactory_analysis
    assert_not_nil assigns(:tasting).gustatory_analysis
    assert_not_nil assigns(:tasting).analysis_conclusion
  end

  test "should get edit" do
    sign_in users(:user_albin)
    tasting = tastings(:tasting_albin_one_wine_albin_one)
    get :edit, wine_id: tasting.wine.id, id: tasting.id
    assert_response :success
    assert_equal tasting, assigns(:tasting)
    assert_equal tasting.wine, assigns(:tasting).wine
  end

  test "should create tasting" do
    albin = users(:user_albin)
    sign_in albin
    wine = albin.wines.first
    assert_difference('Tasting.count') do
      post :create, wine_id: wine.id, tasting: {}
    end
    assert_not_nil assigns(:wine)
    assert_not_nil assigns(:tasting)
    assert_redirected_to [assigns(:wine), assigns(:tasting)]
    assert_equal Tasting.last, assigns(:tasting)
    assert_equal I18n.t('flashes.tasting.create', tasting: assigns(:tasting).full_name), flash[:notice]
  end
end
