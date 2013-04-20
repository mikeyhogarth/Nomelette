require 'test_helper'

class Admin::CategoryTypesControllerTest < ActionController::TestCase
  
  setup do
    login_as(:admin_user)  
    @category_type = category_types(:course)
  end

  test "should not let normal users in" do
    login_as(:normal_user)
    get :index
    assert_redirected_to admin_login_path
  end



  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:category_types)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create category_type" do
    assert_difference('CategoryType.count') do
      post :create, category_type: { name: "foo", slug: "bar" }
    end

    assert_redirected_to admin_category_type_path(assigns(:category_type))
  end

  test "should show admin_category_type" do
    get :show, id: @category_type
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @category_type
    assert_response :success
  end

  test "should update admin_category_type" do
    put :update, id: @category_type, admin_category_type: { name: @category_type.name, slug: @category_type.slug }
    assert_redirected_to admin_category_type_path(assigns(:category_type))
  end

  test "should destroy admin_category_type" do
    assert_difference('CategoryType.count', -1) do
      delete :destroy, id: @category_type
    end

    assert_redirected_to admin_category_types_path
  end
end
