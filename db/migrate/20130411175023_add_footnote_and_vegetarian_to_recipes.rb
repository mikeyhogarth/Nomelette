class AddFootnoteAndVegetarianToRecipes < ActiveRecord::Migration
  
  def change
  	add_column :recipes, :footnote, :text
  	add_column :recipes, :vegetarian, :boolean
  end

end
