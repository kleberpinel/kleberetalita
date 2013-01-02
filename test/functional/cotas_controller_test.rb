require 'test_helper'

class CotasControllerTest < ActionController::TestCase
  setup do
    @cota = cotas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:cotas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create cota" do
    assert_difference('Cota.count') do
      post :create, cota: @cota.attributes
    end

    assert_redirected_to cota_path(assigns(:cota))
  end

  test "should show cota" do
    get :show, id: @cota.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @cota.to_param
    assert_response :success
  end

  test "should update cota" do
    put :update, id: @cota.to_param, cota: @cota.attributes
    assert_redirected_to cota_path(assigns(:cota))
  end

  test "should destroy cota" do
    assert_difference('Cota.count', -1) do
      delete :destroy, id: @cota.to_param
    end

    assert_redirected_to cotas_path
  end
end
