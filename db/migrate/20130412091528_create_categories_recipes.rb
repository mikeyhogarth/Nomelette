class CreateCategoriesRecipes < ActiveRecord::Migration
  def up
    create_table :categories_recipes, :id => false do |t|
      	t.references :recipe
      	t.references :category
    end

    add_index :categories_recipes, [:recipe_id, :category_id]  
    add_index :categories_recipes, [:category_id, :recipe_id]  

  end
  

  def down
  	drop_table :categories_recipes
  end
end
