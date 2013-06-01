require 'test_helper'

class RecipeTest < ActiveSupport::TestCase
	# test "the truth" do
	#   assert true
	# end

	test "should create html equivalent of ingredients when saved" do
		recipe = Recipe.new
		recipe.name = "A recipe"
		recipe.method = "A method"
		recipe.ingredients = "--Section Title \n 2oz *Curry Powder* \n 2oz *Butter* \n 1lb *Onions*, Chopped \n --Section Title Two \n 1/2 Teaspoon *Sugar* \n 1 1/2 lbs Trimmed and Washed *Broccoli*"

		recipe.save

		html_escaped_ingredients = "<h3>Section Title</h3>\n2oz <a href = '/recipes/tagged-with/curry-powder'><span itemprop='name'>Curry Powder</span></a>\n2oz <a href = '/recipes/tagged-with/butter'><span itemprop='name'>Butter</span></a>\n1lb <a href = '/recipes/tagged-with/onions'><span itemprop='name'>Onions</span></a>, Chopped\n<h3>Section Title Two</h3>\n&frac12; Teaspoon <a href = '/recipes/tagged-with/sugar'><span itemprop='name'>Sugar</span></a>\n1 &frac12; lbs Trimmed and Washed <a href = '/recipes/tagged-with/broccoli'><span itemprop='name'>Broccoli</span></a>\n"

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

	test "should_get_tag_description_and_after_saving" do

		recipe = Recipe.create(
			:name => "A recipe with water cress in it",
			:ingredients => "*water cress*", 
			:method => "Do stuff to the water cress")

		cress_tag = recipe.ingredient_tags.first

		assert(cress_tag.present?)

		assert(cress_tag.name == "Water Cress")

		cress_tag_description = IngredientDescription.where(:tag_id => cress_tag.id)

		assert(cress_tag_description.present?)

	end


end
