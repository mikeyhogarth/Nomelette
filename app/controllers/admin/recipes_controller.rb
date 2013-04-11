
class Admin::RecipesController < ApplicationController
  before_filter :admin_only!

  # GET /admin/recipes
  # GET /admin/recipes.json
  def index
    @recipes = Recipe.all
  end

  # GET /admin/recipes/1
  # GET /admin/recipes/1.json
  def show
    @recipe = Recipe.find(params[:id])
  end

  # GET /admin/recipes/new
  # GET /admin/recipes/new.json
  def new
    @recipe = Recipe.new
  end

  # GET /admin/recipes/1/edit
  def edit
    @recipe = Recipe.find(params[:id])
  end

  # POST /admin/recipes
  # POST /admin/recipes.json
  def create
    @recipe = Recipe.new(params[:recipe])

    if @recipe.save
      redirect_to [:admin,@recipe], notice: 'Recipe was successfully created.' 
    else
      render action: "new" 
    end
  end

  # PUT /admin/recipes/1
  # PUT /admin/recipes/1.json
  def update
    @recipe = Recipe.find(params[:id])
    
    if @recipe.update_attributes(params[:recipe])
      redirect_to [:admin, @recipe], notice: 'Recipe was successfully updated.' 
    else
      render action: "edit" 
    end
  
  end

  # DELETE /admin/recipes/1
  # DELETE /admin/recipes/1.json
  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy

    respond_to do |format|
      format.html { redirect_to admin_recipes_url }
      format.json { head :no_content }
    end
  end
end
