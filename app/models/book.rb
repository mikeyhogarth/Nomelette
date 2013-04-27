class Book < ActiveRecord::Base
  attr_accessible :description, :title

  has_many :recipes

  validates_presence_of :title
end
