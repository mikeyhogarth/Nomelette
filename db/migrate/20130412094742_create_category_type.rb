class CreateCategoryType < ActiveRecord::Migration
  def change
  		create_table :category_types do |t|
	    	t.string :name
	    	t.string :slug

	    	t.timestamps
	    end
  end
end
