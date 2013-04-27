class AddPreparationTimeToRecipes < ActiveRecord::Migration
  def change
  	add_column :recipes, :preparation_time, :string
  end
end
