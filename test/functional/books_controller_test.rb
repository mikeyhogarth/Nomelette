require 'test_helper'

class BooksControllerTest < ActionController::TestCase

  setup do
    @book = books(:cooking_for_friends_can_be_fun)
  end

  test "should get show" do
    get :show, :id => @book
    assert_response :success
  end

  test "should get index" do
    get :index
    assert_response :success
  end

end
