class RecipesController < ApplicationController

	def index
		@recipes = Recipe.find(:all, :order => "name ASC")
	end

	def show
		@recipe = Recipe.find(params[:id])
	end

	def tagged_with
		redirect_to root_path and return unless params[:tag]

		@tag = params[:tag].camelize
		@recipes = Recipe.tagged_with(@tag)
		render "index"
	end
end
