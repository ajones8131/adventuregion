# Database migration that adds the category column to the Place Database.

class AddCategoryToPlaces < ActiveRecord::Migration
  def change
    add_column :places, :category, :string
  end
end
