require 'test_helper'

class TagsControllerTest < ActionController::TestCase
  test "should get show" do
    get :show, :tag => :foo
    assert_response :success
  end

end
