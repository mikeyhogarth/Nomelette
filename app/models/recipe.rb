class Recipe < ActiveRecord::Base
	include NomeletteHelpers

  	attr_accessible :name, :description, :ingredients, :method, :cooking_time, :serves

  	#validations
	validates_presence_of :name, :ingredients, :method
	validates_uniqueness_of :name
	  
	#scopes
	scope :latest, lambda { |num| {:order => "created_at DESC", :limit => num} }
	scope :with_image, where("image_file_name IS NOT NULL and image_file_name <> ''")
	scope :popular, lambda { |num| {:limit => num} }

	#callbacks
	before_save :tidy_up_user_input

	private
	def tidy_up_user_input
		self.description = description.squish
		self.ingredients = NomeletteHelpers::StringHelper.remove_empty_lines(ingredients)
		self.method = NomeletteHelpers::StringHelper.remove_empty_lines(method)
	end

end
