require 'test_helper'

class CategoriaCotasControllerTest < ActionController::TestCase
  setup do
    @categoria_cota = categoria_cotas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:categoria_cotas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create categoria_cota" do
    assert_difference('CategoriaCota.count') do
      post :create, categoria_cota: @categoria_cota.attributes
    end

    assert_redirected_to categoria_cota_path(assigns(:categoria_cota))
  end

  test "should show categoria_cota" do
    get :show, id: @categoria_cota.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @categoria_cota.to_param
    assert_response :success
  end

  test "should update categoria_cota" do
    put :update, id: @categoria_cota.to_param, categoria_cota: @categoria_cota.attributes
    assert_redirected_to categoria_cota_path(assigns(:categoria_cota))
  end

  test "should destroy categoria_cota" do
    assert_difference('CategoriaCota.count', -1) do
      delete :destroy, id: @categoria_cota.to_param
    end

    assert_redirected_to categoria_cotas_path
  end
end
