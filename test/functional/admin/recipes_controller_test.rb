require 'test_helper'

class Admin::RecipesControllerTest < ActionController::TestCase

  setup do
    login_as(:admin_user)
    @recipe = recipes(:spag_bol)
  end

  test "should not let normal users in" do
    login_as(:normal_user)
    get :index
    assert_redirected_to admin_login_path
  end

  test "should get index" do
    get :index
    assert_not_nil assigns(:recipes)
    assert_response :success
  end

  test "should get admin recipe home page" do
    get :new
    assert_response :success
  end

  test "should allow new recipes to be created" do
    assert_difference('Recipe.count') do
      post :create, recipe: 
      { 
        cooking_time: @recipe.cooking_time, 
        description: @recipe.description, 
        ingredients: @recipe.ingredients, 
        method: @recipe.method, 
        name: "Test Recipe", 
        serves: @recipe.serves 
      }
    end

    assert_redirected_to admin_recipe_path(assigns(:recipe))
  end

  test "should show a recipe admin screen" do
    get :show, id: @recipe
    assert_not_nil assigns(:recipe)
    assert_response :success
  end

  test "should get recipe edit page" do
    get :edit, id: @recipe
    assert_response :success
  end

  test "should allow recipe to be updated" do
    put :update, id: @recipe, recipe: { cooking_time: @recipe.cooking_time, description: @recipe.description, ingredients: @recipe.ingredients, method: @recipe.method, name: @recipe.name, serves: @recipe.serves }
    assert(assigns(:recipe))
    assert_redirected_to admin_recipe_path(assigns(:recipe))
  end

  test "should allow recipe to be deleted" do
    assert_difference('Recipe.count', -1) do
      delete :destroy, id: @recipe
    end

    assert_redirected_to admin_recipes_path
  end
end
