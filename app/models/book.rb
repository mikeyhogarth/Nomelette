class Book < ActiveRecord::Base
  attr_accessible :description, :title

  has_many :recipes
end
