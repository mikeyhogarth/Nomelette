class CategoryTypesController < ApplicationController
  def index
  	@category_types = CategoryType.includes(:categories).joins(:categories)
  end
end
