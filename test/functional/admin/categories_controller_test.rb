require 'test_helper'

class Admin::CategoriesControllerTest < ActionController::TestCase
  
  setup do
    login_as(:admin_user)  
    @category = categories(:starter)
  end

  test "should not let normal users in" do
    login_as(:normal_user)
    get :index
    assert_redirected_to admin_login_path
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:categories)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create category" do
    assert_difference('Category.count') do
      post :create, category: { name: "foo", slug: "bar" }
    end

    assert_redirected_to admin_category_path(assigns(:category))
  end

  test "should show category" do
    get :show, id: @category
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @category
    assert_response :success
  end

  test "should update category" do
    put :update, id: @category, category: { name: @category.name, slug: @category.slug }
    assert_redirected_to admin_category_path(assigns(:category))
  end

  test "should destroy category" do
    assert_difference('Category.count', -1) do
      delete :destroy, id: @category
    end

    assert_redirected_to admin_categories_path
  end
end
