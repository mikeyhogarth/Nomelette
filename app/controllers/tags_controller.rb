class TagsController < ApplicationController
  def show
	redirect_to root_path and return unless params.include? :tag
	
	@tag = params[:tag].titleize
	@recipes = Recipe.tagged_with([@tag.singularize, @tag.pluralize], :any => true)
  end
end
