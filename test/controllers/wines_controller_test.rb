require 'test_helper'
require 'helpers/controllers/authentication_test_helper'
require 'helpers/controllers/authorization_test_helper'

class WinesControllerTest < ActionController::TestCase
  include Devise::TestHelpers
  include AuthenticationTestHelper
  include AuthorizationTestHelper

  authentification_test_for :get, :index
  authentification_test_for :get, :show, id: 1
  authentification_test_for :get, :new
  authentification_test_for :get, :edit, id: 1
  authentification_test_for :post, :create
  authentification_test_for :patch, :update, id: 1
  authentification_test_for :delete, :destroy, id: 1

  authorization_test_for :get, :edit, 'users(:user_alianaya)', id: 'wines(:wine_albin_one).id'
  authorization_test_for :patch, :update, 'users(:user_alianaya)', id: 'wines(:wine_albin_one).id'
  authorization_test_for :delete, :destroy, 'users(:user_alianaya)', id: 'wines(:wine_albin_one).id'

  test "should get index" do
    sign_in users(:user_albin)
    get :index
    assert_response :success
    assert_equal Wine.all.count, assigns(:wines).count
  end

  test "should get show" do
    sign_in users(:user_albin)
    wine = wines(:wine_albin_one)
    get :show, id: wine.id
    assert_response :success
    assert_equal wine, assigns(:wine)
    assert_not_nil assigns(:tasting)
  end

  test "should get new" do
    sign_in users(:user_albin)
    get :new
    assert_response :success
    assert_not_nil assigns(:wine)
  end

  test "should get edit" do
    sign_in users(:user_albin)
    wine = wines(:wine_albin_one)
    get :edit, id: wine.id
    assert_response :success
    assert_equal wine, assigns(:wine)
    assert_equal Grape.all.count, assigns(:grapes).count
  end

  test "should create wine" do
    albin = users(:user_albin)
    sign_in albin
    assert_difference('Wine.count') do
      post :create, wine: {color: Wine.colors.keys.first, appellation: 'Châteauneuf-du-Pape', vintage: 2010, domaine: 'Domaine des pères de l\'Église', alcohol_rate: 12.5, vinification_type: Wine.vinification_types.keys.first, grapes: [Grape.first.id, Grape.second.id]}
    end
    assert_not_nil assigns(:wine)
    assert_redirected_to wine_path(assigns(:wine))
    assert_equal Wine.last, assigns(:wine)
    assert_equal I18n.t('flashes.wines.create', wine: assigns(:wine).full_name), flash[:notice]
  end

  test "should not create wine" do
    albin = users(:user_albin)
    sign_in albin
    assert_no_difference('Wine.count') do
      post :create, wine: {alcohol_rate: "wrong_input"}
    end
    assert_template :new
    assert_equal Grape.all.count, assigns(:grapes).count
    assert_equal I18n.t('flashes.forms.not_accepted'), flash[:alert]
  end

  test "should update wine" do
    albin = users(:user_albin)
    sign_in albin
    wine = wines(:wine_albin_one)
    patch :update, id: wine.id, wine: {color: Wine.colors.keys.second}
    assert_redirected_to wine_path(assigns(:wine))
    assert_equal Wine.find(wine.id), assigns(:wine)
    assert_not_equal wine.color, assigns(:wine).color
    assert_not_equal wine.color, Wine.find(wine.id).color
    assert_equal I18n.t('flashes.wines.update', wine: assigns(:wine).full_name), flash[:notice]
  end

  test "should not update wine" do
    albin = users(:user_albin)
    sign_in albin
    wine = wines(:wine_albin_one)
    patch :update, id: wine.id, wine: {color: Wine.colors.keys.second, alcohol_rate: "wrong_input"}
    assert_template :edit
    assert_equal Wine.find(wine.id), assigns(:wine)
    assert_not_equal wine.color, assigns(:wine).color
    assert_equal wine.color, Wine.find(wine.id).color
    assert_not_nil assigns(:wine).errors[:alcohol_rate]
    assert_equal Grape.all.count, assigns(:grapes).count
    assert_equal I18n.t('flashes.forms.not_accepted'), flash[:alert]
  end

  test "should destroy wine" do
    albin = users(:user_albin)
    sign_in albin
    wine = wines(:wine_albin_one)
    assert_difference('Wine.count', -1) do
      delete :destroy, id: wine.id
    end
    assert_redirected_to wines_path
    assert_raises(ActiveRecord::RecordNotFound) do
      Wine.find(wine.id)
    end
    assert_equal I18n.t('flashes.wines.destroy', wine: assigns(:wine).full_name), flash[:notice]
  end
end
