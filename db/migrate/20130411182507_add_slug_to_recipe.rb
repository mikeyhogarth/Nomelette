class AddSlugToRecipe < ActiveRecord::Migration
  def change
  	add_column 	:recipes, :slug, :string
  	add_index 	:recipes, :slug, unique: true

  	#re-save all recipes so change takes effect
  	Recipe.find_each(&:save)
  end
end
