class HomeController < ApplicationController
  
  def index  	
  	@latest_recipes = Recipe.latest 10

  	@featured_recipes = Recipe.featured 6

    @recipes_with_images = Recipe.with_image.limit 2

  	@category_types = CategoryType.includes(:categories).joins([:categories])
  end

  def about
  end

  def contact
  end

end