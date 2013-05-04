class CreateIngredientDescriptions < ActiveRecord::Migration
  def change
    create_table :ingredient_descriptions do |t|
      t.references :tag
      t.string :name
      t.text :text

      t.timestamps
    end
  end
end
