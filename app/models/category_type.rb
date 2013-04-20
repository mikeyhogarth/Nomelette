class CategoryType < ActiveRecord::Base
	extend FriendlyId
	friendly_id :name, :use => :slugged

	attr_accessible :name, :slug

	#validations
	validates_presence_of :name
	validates_uniqueness_of :name

	#associations
	has_many :categories

	#scopes
	default_scope order('category_types.name ASC')

end
