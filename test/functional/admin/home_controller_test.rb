require 'test_helper'

class Admin::HomeControllerTest < ActionController::TestCase

setup do
	login_as(:admin_user)
end

test "should get index" do
	get :index
    assert_response :success
end

test "should not let normal users in" do
	login_as(:normal_user)
	get :index
	assert_redirected_to admin_login_path
end

end
