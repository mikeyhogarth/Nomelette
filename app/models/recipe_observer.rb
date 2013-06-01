require 'action_view'

class RecipeObserver < ActiveRecord::Observer	
	include ActionView::Helpers::SanitizeHelper

	def before_validation(recipe)
		tidy_up_user_input_for(recipe)		
		create_html_and_tags_for(recipe)
	end

	def after_save(recipe)
		put_in_wikipedia_descriptions_for_tags_for(recipe)
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

		  ingredient = ingredient_match[0]
		  titleized_ingredient = ingredient.titleize	  	      
	      link_to_tag = Rails.application.routes.url_helpers.tag_path(ingredient.parameterize)
		  recipe.html_ingredients = recipe.html_ingredients.sub("*#{ingredient}*", "<a href = '#{link_to_tag}'><span itemprop='name'>#{titleized_ingredient}</span></a>")
	      ingredient_tag_array << titleized_ingredient unless ingredient_tag_array.include? titleized_ingredient	      

	    end

	    new_html_ingredients = String.new

	    recipe.html_ingredients.each_line do |line| 
	    	if line.starts_with? "--"
				new_html_ingredients << "<h3>#{line[2..line.length].strip}</h3>\n"
	    	else
	    		new_html_ingredients << line
	    	end
	    end

	    recipe.html_ingredients = new_html_ingredients

	    recipe.ingredient_tag_list = ingredient_tag_array.join(", ") unless(ingredient_tag_array.empty?)
	    		
	end

	def put_in_wikipedia_descriptions_for_tags_for(recipe)
		
		wikipedia_client = ThirdParty::Wikipedia.new

		recipe.ingredient_tags.each do |ingredient_tag|
			
			next unless(IngredientDescription.find_by_tag_id(ingredient_tag.id).nil?)

			brief_description_of_ingredient = strip_tags(wikipedia_client.get_description_for(ingredient_tag.name))

			next if brief_description_of_ingredient and brief_description_of_ingredient.include?("may refer to")
			
			IngredientDescription.new(:tag_id => ingredient_tag.id, :name => ingredient_tag.name.singularize, :text => brief_description_of_ingredient).save

		end

	end

end
