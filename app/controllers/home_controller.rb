class HomeController < ApplicationController
  def index
  	@latest_recipes = Recipe.latest 5  	 
  end

  def about
  end

  def contact
  end
end
