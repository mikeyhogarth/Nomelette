require 'test_helper'

class Admin::IngredientDescriptionsControllerTest < ActionController::TestCase
  setup do
    @ingredient_description = ingredient_descriptions(:one)
    login_as(:admin_user)
  end

  test "should not let normal users in" do
    login_as(:normal_user)
    get :index
    assert_redirected_to admin_login_path
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:ingredient_descriptions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create admin_ingredient_description" do
    assert_difference('IngredientDescription.count') do
      post :create, ingredient_description: { tag_id: @ingredient_description.tag_id, text: @ingredient_description.text }
    end

    assert_redirected_to admin_ingredient_description_path(assigns(:ingredient_description))
  end

  test "should show admin_ingredient_description" do
    get :show, id: @ingredient_description
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @ingredient_description
    assert_response :success
  end

  test "should update admin_ingredient_description" do
    put :update, id: @ingredient_description, ingredient_description: { tag_id: @ingredient_description.tag_id, text: @ingredient_description.text }
    assert_redirected_to admin_ingredient_description_path(assigns(:ingredient_description))
  end

  test "should destroy admin_ingredient_description" do
    assert_difference('IngredientDescription.count', -1) do
      delete :destroy, id: @ingredient_description
    end

    assert_redirected_to admin_ingredient_descriptions_path
  end
end
