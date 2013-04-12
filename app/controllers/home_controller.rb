class HomeController < ApplicationController
  def index
  	@latest_recipes = Recipe.latest 5  	 
  	@category_types = CategoryType.includes(:categories).joins([:categories])
  end

  def about
  end

  def contact
  end
end
