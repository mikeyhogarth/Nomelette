class CategoriesController < ApplicationController
  def show
	@category = Category.find(params[:id])
  end

  def index
  	@categories = Category.find(:all)
  end
end
