require 'test_helper'

class SessionsControllerTest < ActionController::TestCase
  
  test "should allow users to log in with correct password" do
  	post :create, { username: "admin_user", password: "the wrong password"}
  	assert_redirected_to login_path
  
    post :create, { username: "admin_user", password: "password" }
    assert_redirected_to root_path
  end


  test "should allow users to log out" do
    get :destroy
    assert_redirected_to root_path
  end

end
