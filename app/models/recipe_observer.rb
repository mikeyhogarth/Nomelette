class RecipeObserver < ActiveRecord::Observer

	def before_validation(recipe)
		tidy_up_user_input_for(recipe)		
		create_html_and_tags_for(recipe)
	end

	#private methods
	private

	def tidy_up_user_input_for(recipe)
		recipe.name = recipe.name.squish.camelize
		recipe.description = recipe.description.squish if recipe.description
		recipe.ingredients = NomeletteHelpers::StringHelper.remove_empty_lines(recipe.ingredients)
		recipe.method = NomeletteHelpers::StringHelper.remove_empty_lines(recipe.method)
	end


	def create_html_and_tags_for(recipe)
	
		#Escape things like fractions
		recipe.html_ingredients = NomeletteHelpers::StringHelper.format_ingredient(recipe.ingredients)
		
		#Lots of expensive stuff happening here, so we'll calculate it all on save and put it in the database
		#rather than each time a recipe is rendered.
		
		ingredient_tag_array = Array.new

		recipe.ingredients.scan(/\*([a-zA-Z0-9 ]+)\*/) do |ingredient_match|					  

		  ingredient = ingredient_match[0].titleize
		  	      
	      link_to_tag = Rails.application.routes.url_helpers.tag_path(ingredient.parameterize)

		  recipe.html_ingredients = recipe.html_ingredients.sub("*#{ingredient}*",
	      	"<a href = '#{link_to_tag}'>#{ingredient}</a>")

	      ingredient_tag_array << ingredient unless ingredient_tag_array.include? ingredient

	    end

	    recipe.ingredient_tag_list = ingredient_tag_array.join(", ") 

	end


end
