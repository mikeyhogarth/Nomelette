class CreateAdminBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :title
      t.text :description

      t.timestamps
    end

    add_column :recipes, :book_id, :integer
  end
end
