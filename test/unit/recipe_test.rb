require 'test_helper'

class RecipeTest < ActiveSupport::TestCase
	# test "the truth" do
	#   assert true
	# end

	test "should create html equivalent of ingredients when saved" do
		recipe = Recipe.new
		recipe.name = "A recipe"
		recipe.method = "A method"
		recipe.ingredients = "2oz *Butter* \n 1lb *Onions*, Chopped \n 1/2 Teaspoon *Sugar* \n 1 1/2 lbs Trimmed and Washed *Broccoli*"

		recipe.save

		html_escaped_ingredients = "2oz <a href = 'tagged_with/butter'>Butter</a>\n1lb <a href = 'tagged_with/onions'>Onions</a>, Chopped\n&frac12; Teaspoon <a href = 'tagged_with/sugar'>Sugar</a>\n1 &frac12; lbs Trimmed and Washed <a href = 'tagged_with/broccoli'>Broccoli</a>\n"

		assert_equal html_escaped_ingredients, recipe.html_ingredients

	end


	test "should tag up recipe with ingredients when saved" do

		recipe = Recipe.new
		recipe.name = "A recipe"
		recipe.method = "A method"
		recipe.ingredients = "2oz *Butter* \n 1lb *Onions*, Chopped \n 1/2 Teaspoon *Sugar* \n 1 1/2 lbs Trimmed and Washed *Broccoli*"

		recipe.save

		assert_equal(4, recipe.ingredient_tags.count)

	end


end
