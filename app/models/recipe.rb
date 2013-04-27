class Recipe < ActiveRecord::Base
	extend FriendlyId

	#Friendly id gem gives nicer URL
  	friendly_id :name, use: :slugged

  	attr_accessible :name, :image, :description, :ingredients, :method, :preparation_time, :cooking_time, :serves, :vegetarian, :footnote, :book_id, :category_ids, :slug

  	has_attached_file 	:image, 
  						:styles => { :full => "500x500>", :medium => "300x300>" , :thumb => "100x100>" }, 
  						:storage => :s3,					  						
					    :path => ":attachment/recipes/:basename/:basename-:style.:extension"
	
	acts_as_taggable_on :ingredient_tags	

  	#validations
	validates_presence_of :name, :ingredients, :html_ingredients, :method
	validates_uniqueness_of :name

	#associations
	has_and_belongs_to_many :categories
	belongs_to :book
	  
	#scopes	
	scope :latest, lambda { |num| {:order => "created_at DESC, name ASC", :limit => num} }
	scope :with_image, where("image_file_name IS NOT NULL and image_file_name <> ''").order("created_at DESC")
	scope :popular, lambda { |num| {:limit => num} }

	#public methods
	def mentions_serves_or_times
		return !(
			self.cooking_time.blank? and 
			self.preparation_time.blank? and 
			self.serves.blank?)
	end

end
