class CreateUserProfiles < ActiveRecord::Migration
  def change
    create_table :user_profiles do |t|
      t.references :user
      t.string :full_name
      t.string :avatar_url

      t.timestamps
    end
  end
end
