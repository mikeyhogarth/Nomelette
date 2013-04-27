class Book < ActiveRecord::Base
  attr_accessible :title, :description

  has_many :recipes

  validates_presence_of :title
end
