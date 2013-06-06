require 'test_helper'

class ImporterControllerTest < ActionController::TestCase
  test "should get importar" do
    get :importar
    assert_response :success
  end

end
