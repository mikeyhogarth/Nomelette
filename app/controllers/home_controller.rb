class HomeController < ApplicationController
  def index  	
  	@latest_recipes = Recipe.latest 5
  	@featured_recipes = Recipe.featured 6
  	@category_types = CategoryType.includes(:categories).joins([:categories])
  	@recipes_with_images = Recipe.with_image.limit(6)
  end

  def about
  end

  def contact
  end
end
