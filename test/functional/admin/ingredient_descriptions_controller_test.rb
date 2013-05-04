require 'test_helper'

class Admin::IngredientDescriptionsControllerTest < ActionController::TestCase
  setup do
    @admin_ingredient_description = admin_ingredient_descriptions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:admin_ingredient_descriptions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create admin_ingredient_description" do
    assert_difference('Admin::IngredientDescription.count') do
      post :create, admin_ingredient_description: { tag_id: @admin_ingredient_description.tag_id, text: @admin_ingredient_description.text }
    end

    assert_redirected_to admin_ingredient_description_path(assigns(:admin_ingredient_description))
  end

  test "should show admin_ingredient_description" do
    get :show, id: @admin_ingredient_description
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @admin_ingredient_description
    assert_response :success
  end

  test "should update admin_ingredient_description" do
    put :update, id: @admin_ingredient_description, admin_ingredient_description: { tag_id: @admin_ingredient_description.tag_id, text: @admin_ingredient_description.text }
    assert_redirected_to admin_ingredient_description_path(assigns(:admin_ingredient_description))
  end

  test "should destroy admin_ingredient_description" do
    assert_difference('Admin::IngredientDescription.count', -1) do
      delete :destroy, id: @admin_ingredient_description
    end

    assert_redirected_to admin_ingredient_descriptions_path
  end
end
