require 'test_helper'

class Admin::UsersControllerTest < ActionController::TestCase

  setup do
    login_as(:admin_user)
    @user = users(:normal_user)
  end

  test "should not let normal users in" do
    login_as(:normal_user)
    get :index
    assert_redirected_to admin_login_path
  end

  test "should get user admin home page" do
    get :index
    assert_response :success
    assert_not_nil assigns(:users)
  end

  test "should get new user page" do
    get :new
    assert_response :success
  end

  test "should allow new user to be created" do
    assert_difference('User.count') do
      post :create, user: { username: "test_user", admin: false, password: "foo", password_confirmation: "foo" }
    end

    assert_redirected_to admin_user_path(assigns(:user))
  end

  test "should show a user" do
    get :show, id: @user
    assert_response :success
  end

  test "should get edit user page" do
    get :edit, id: @user
    assert_response :success
  end

  test "should allow user to be updated" do
    put :update, id: @user, admin_user: { admin: @user.admin, password_digest: @user.password_digest, username: @user.username }
    assert(assigns(:user))
    assert_redirected_to admin_user_path(assigns(:user))
  end

  test "should allow user to be deleted" do
    assert_difference('User.count', -1) do
      delete :destroy, id: @user
    end

    assert_redirected_to admin_users_path
  end
end
