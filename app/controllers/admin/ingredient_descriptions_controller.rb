
class Admin::IngredientDescriptionsController < ApplicationController
  before_filter :admin_only!

  # GET /admin/ingredient_descriptions
  # GET /admin/ingredient_descriptions.json
  def index
    @ingredient_descriptions = IngredientDescription.find(:all)
  end


  # GET /admin/ingredient_descriptions/1
  # GET /admin/ingredient_descriptions/1.json
  def show
    @ingredient_description = IngredientDescription.find(params[:id])
  end


  # GET /admin/ingredient_descriptions/new
  # GET /admin/ingredient_descriptions/new.json
  def new
    @ingredient_description = IngredientDescription.new    
  end


  # GET /admin/ingredient_descriptions/1/edit
  def edit
    @ingredient_description = IngredientDescription.find(params[:id])
  end


  # POST /admin/ingredient_descriptions
  # POST /admin/ingredient_descriptions.json
  def create
    @ingredient_description = IngredientDescription.new(params[:ingredient_description])
    
    if @ingredient_description.save
      redirect_to [:admin,@ingredient_description], notice: 'Ingredient description was successfully created.'       
    else
      render action: "new"       
    end    
  end


  # PUT /admin/ingredient_descriptions/1
  # PUT /admin/ingredient_descriptions/1.json
  def update
    @ingredient_description = IngredientDescription.find(params[:id])

    if @ingredient_description.update_attributes(params[:ingredient_description])
      redirect_to [:admin,@ingredient_description], notice: 'Ingredient description was successfully updated.'         
    else
      render action: "edit"         
    end
    
  end

  # DELETE /admin/ingredient_descriptions/1
  # DELETE /admin/ingredient_descriptions/1.json
  def destroy
    @ingredient_description = IngredientDescription.find(params[:id])
    @ingredient_description.destroy

    redirect_to admin_ingredient_descriptions_url 

  end
end
