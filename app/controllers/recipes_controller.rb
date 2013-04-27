class RecipesController < ApplicationController

	def index
		@recipes = Recipe.find(:all, :order => "name ASC")
	end

	def show
		@recipe = Recipe.find(params[:id])
	end

end
