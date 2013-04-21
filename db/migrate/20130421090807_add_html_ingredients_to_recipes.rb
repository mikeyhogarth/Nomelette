class AddHtmlIngredientsToRecipes < ActiveRecord::Migration
  def change
  	add_column :recipes, :html_ingredients, :text 	
  end



end
