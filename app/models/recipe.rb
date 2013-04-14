class Recipe < ActiveRecord::Base
	include NomeletteHelpers
	extend FriendlyId

	#Friendly id gem gives nicer URL
  	friendly_id :name, use: :slugged

  	attr_accessible :name, :image, :description, :ingredients, :method, :cooking_time, :serves, :vegetarian, :footnote, :category_ids, :slug

  	has_attached_file 	:image, 
  						:styles => { :full => "500x500>", :medium => "300x300>" , :thumb => "100x100>" }, 
  						:default_url => "/images/:style/missing.png",
  						:storage => :s3,					    
					    :path => ":attachment/recipes/:basename/:basename-:style.:extension",
					    :default_url => "/images/recipes/no-img.jpg"


  	#validations
	validates_presence_of :name, :ingredients, :method
	validates_uniqueness_of :name

	#associations
	has_and_belongs_to_many :categories
	  
	#scopes
	scope :latest, lambda { |num| {:order => "created_at DESC", :limit => num} }
	scope :with_image, where("image_file_name IS NOT NULL and image_file_name <> ''")
	scope :popular, lambda { |num| {:limit => num} }

	#callbacks
	before_save :tidy_up_user_input

	#public methods
	def mentions_serves_or_cooking_time
		return !(self.cooking_time.empty? and self.serves.empty?)
	end


	#private methods
	private
	def tidy_up_user_input
		self.description = description.squish
		self.ingredients = NomeletteHelpers::StringHelper.remove_empty_lines(ingredients)
		self.method = NomeletteHelpers::StringHelper.remove_empty_lines(method)
	end

end
