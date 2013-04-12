require 'test_helper'

class Admin::CategoryTypesControllerTest < ActionController::TestCase
  setup do
    @admin_category_type = admin_category_types(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:admin_category_types)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create admin_category_type" do
    assert_difference('Admin::CategoryType.count') do
      post :create, admin_category_type: { name: @admin_category_type.name, slug: @admin_category_type.slug }
    end

    assert_redirected_to admin_category_type_path(assigns(:admin_category_type))
  end

  test "should show admin_category_type" do
    get :show, id: @admin_category_type
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @admin_category_type
    assert_response :success
  end

  test "should update admin_category_type" do
    put :update, id: @admin_category_type, admin_category_type: { name: @admin_category_type.name, slug: @admin_category_type.slug }
    assert_redirected_to admin_category_type_path(assigns(:admin_category_type))
  end

  test "should destroy admin_category_type" do
    assert_difference('Admin::CategoryType.count', -1) do
      delete :destroy, id: @admin_category_type
    end

    assert_redirected_to admin_category_types_path
  end
end
