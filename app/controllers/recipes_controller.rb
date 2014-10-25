class RecipesController < ApplicationController

	def index
    @recipes = Recipe.order(:name).page params[:page]
	end

	def show
		@recipe = Recipe.find(params[:id])
	end

end
