class Recipe < ActiveRecord::Base
	include NomeletteHelpers
	extend FriendlyId

	#Friendly id gem gives nicer URL
  	friendly_id :name, use: :slugged

  	attr_accessible :name, :image, :description, :ingredients, :method, :cooking_time, :serves, :vegetarian, :footnote, :category_ids, :slug

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
	  
	#scopes
	default_scope order('recipes.name ASC')
	scope :latest, lambda { |num| {:order => "created_at DESC", :limit => num} }
	scope :with_image, where("image_file_name IS NOT NULL and image_file_name <> ''")
	scope :popular, lambda { |num| {:limit => num} }

	#callbacks
	before_validation :tidy_up_user_input	

	#public methods
	def mentions_serves_or_cooking_time
		return !(self.cooking_time.empty? and self.serves.empty?)
	end

	#private methods
	private
	def tidy_up_user_input
		self.name = name.squish.camelize
		self.description = description.squish if description
		self.ingredients = NomeletteHelpers::StringHelper.remove_empty_lines(ingredients)
		self.method = NomeletteHelpers::StringHelper.remove_empty_lines(method)
		create_html_equivalent_of_ingredients
	end

	def create_html_equivalent_of_ingredients
	
		#Escape things like fractions
		self.html_ingredients = NomeletteHelpers::StringHelper.format_ingredient(self.ingredients)
		
		ingredient_tag_array = Array.new

		self.ingredients.scan(/\*\w+\*/) do |ingredient|	      
	      ingredient_without_asterisks = ingredient.gsub("*","")
	      ingredient_tag = ingredient_without_asterisks.downcase.camelize
	      self.html_ingredients = html_ingredients.sub(ingredient,"<a href = 'tagged_with/#{ingredient_tag.downcase}'>#{ingredient_tag}</a>")
	      ingredient_tag_array << ingredient_tag
	    end

	    self.ingredient_tag_list = ingredient_tag_array.join(", ") 

	end

end
