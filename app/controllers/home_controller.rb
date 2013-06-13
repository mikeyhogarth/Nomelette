class HomeController < ApplicationController
  
  def index  	
  	@latest_recipes = Recipe.latest 20
  	@featured_recipes = Recipe.featured 6
    @popular_recipes = Recipe.with_description.with_image.shuffle.take(4)
    @recipe_of_the_day = Recipe.of_the_day
  end

  def about
  end

  def contact
  end

end