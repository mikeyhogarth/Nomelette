class AddHtmlIngredientsToRecipes < ActiveRecord::Migration
  def change
  	add_column :recipes, :html_ingredients, :text

  	#re-save all recipes so change takes effect
  	Recipe.find_each(&:save)
  	
  end



end
