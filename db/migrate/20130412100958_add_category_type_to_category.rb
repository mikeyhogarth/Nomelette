class AddCategoryTypeToCategory < ActiveRecord::Migration
  def change
  	add_column :categories, :category_type_id, :integer
  end
end
