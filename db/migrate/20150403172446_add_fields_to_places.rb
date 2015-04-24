# Database migration that adds the Name, Placeid, Type, Price and Popularity Column to the Place Database.

class AddFieldsToPlaces < ActiveRecord::Migration
  def change
    add_column :places, :name, :string
    add_column :places, :placeid, :string
    add_column :places, :type, :string
    add_column :places, :price, :string
    add_column :places, :popularity, :string
  end
end
