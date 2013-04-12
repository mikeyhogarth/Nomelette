class Category < ActiveRecord::Base
	extend FriendlyId
	friendly_id :name, :use => :slugged

	attr_accessible :name, :category_type_id

	#validations
	validates_presence_of :name
	validates_uniqueness_of :name

	#associations
    belongs_to :category_type
	has_and_belongs_to_many :recipes

end
