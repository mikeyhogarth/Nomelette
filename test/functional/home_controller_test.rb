require 'test_helper'

class HomeControllerTest < ActionController::TestCase
  test "should get home page" do
    get :index
    assert_response :success
  end

  test "should get about page" do
    get :about
    assert_response :success
  end

  test "should get contact page" do
    get :contact
    assert_response :success
  end

end
