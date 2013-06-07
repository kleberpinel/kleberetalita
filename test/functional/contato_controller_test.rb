require 'test_helper'

class ContatoControllerTest < ActionController::TestCase
  test "should get form" do
    get :form
    assert_response :success
  end

  test "should get enviar" do
    get :enviar
    assert_response :success
  end

end
