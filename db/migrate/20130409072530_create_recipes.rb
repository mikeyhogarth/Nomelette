class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.string :name
      t.string :serves
      t.string :cooking_time
      t.text :description
      t.text :ingredients
      t.text :method

      t.timestamps
    end
  end
end
