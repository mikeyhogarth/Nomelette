class TagsController < ApplicationController
  def show
    redirect_to root_path and return unless params.include? :tag
    
    @tag = params[:tag].titleize
    @recipes = Recipe.tagged_with([@tag.singularize, @tag.pluralize], :any => true)

    redirect_to root_path and return if @recipes.blank? 


    tag = @recipes.first.ingredient_tags.where("lower(name) = ?", @tag.singularize.downcase).first
    if(tag)		
      ingredient_description = IngredientDescription.find_by_tag_id(tag.id)
  
      @ingredient_description = ingredient_description.text if ingredient_description
    end

  end
end
