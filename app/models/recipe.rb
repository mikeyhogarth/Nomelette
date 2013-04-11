class Recipe < ActiveRecord::Base
  attr_accessible :cooking_time, :description, :ingredients, :method, :name, :serves
end
