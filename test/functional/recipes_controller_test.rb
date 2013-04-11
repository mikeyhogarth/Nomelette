require 'test_helper'

class RecipesControllerTest < ActionController::TestCase

  setup do
    @recipe = recipes(:spag_bol)
  end

  test "should get show" do
    get :show, id: @recipe
    assert assigns(:recipe)
    assert_response :success
  end

end
