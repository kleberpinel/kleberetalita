require 'test_helper'

class CategoriaControllerTest < ActionController::TestCase
  setup do
    @categorias = categoria(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:categoria)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create categorias" do
    assert_difference('Categorias.count') do
      post :create, categorias: @categorias.attributes
    end

    assert_redirected_to categorias_path(assigns(:categorias))
  end

  test "should show categorias" do
    get :show, id: @categorias.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @categorias.to_param
    assert_response :success
  end

  test "should update categorias" do
    put :update, id: @categorias.to_param, categorias: @categorias.attributes
    assert_redirected_to categorias_path(assigns(:categorias))
  end

  test "should destroy categorias" do
    assert_difference('Categorias.count', -1) do
      delete :destroy, id: @categorias.to_param
    end

    assert_redirected_to categoria_path
  end
end
