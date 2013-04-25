class RecipesController < ApplicationController

	def index
		@recipes = Recipe.find(:all, :order => "name ASC")
	end

	def show
		@recipe = Recipe.find(params[:id])
	end

	def tagged_with
		redirect_to root_path and return unless params[:tag]
		@tag = params[:tag].gsub("-"," ")

		tags_to_match = [@tag]

		#add the alternative, either the plural or the singular, to the search
		
		if @tag.ends_with? "s"
			tags_to_match << @tag[0...@tag.length-1] 
		else
			tags_to_match << @tag.pluralize 
		end

		@recipes = Recipe.tagged_with(tags_to_match, :any => true)
		
		render "index"
	end
end
