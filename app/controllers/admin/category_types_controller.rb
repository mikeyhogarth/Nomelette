class Admin::CategoryTypesController < ApplicationController

  
  # GET /admin/category_types
  def index
    @category_types = CategoryType.all
  end


  # GET /admin/category_types/1
  def show
    @category_type = CategoryType.find(params[:id])    
  end


  # GET /admin/category_types/new
  def new
    @category_type = CategoryType.new
  end


  # GET /admin/category_types/1/edit
  def edit
    @category_type = CategoryType.find(params[:id])
  end


  # POST /admin/category_types
  def create
    @category_type = CategoryType.new(params[:category_type])

    if @category_type.save
      redirect_to [:admin, @category_type], notice: 'Category type was successfully created.' 
    else
      render action: "new"         
    end   
  end


  # PUT /admin/category_types/1
  def update
      @category_type = CategoryType.find(params[:id])

      if @category_type.update_attributes(params[:category_type])
        redirect_to [:admin,@category_type], notice: 'Category type was successfully updated.' 
      else
        render action: "edit" 
      end
    
  end
  

  # DELETE /admin/category_types/1
  # DELETE /admin/category_types/1.json
  def destroy
    @category_type = CategoryType.find(params[:id])
    @category_type.destroy    
    redirect_to admin_category_types_url     
  end

end
