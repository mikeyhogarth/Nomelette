require 'test_helper'

class TagsControllerTest < ActionController::TestCase
  setup do
  end

  test "should get show" do
  	recipe = recipes(:spag_bol)
  	recipe.ingredient_tag_list = "Beef,Spagetti"
  	recipe.save

  	first_tag = recipe.ingredient_tags.first

    get :show, :tag => first_tag.name

    assert_tag :tag => "blockquote"

    assert_response :success
  end

end
