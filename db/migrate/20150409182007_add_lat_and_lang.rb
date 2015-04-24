# Database migration that adds the latitude and longtitude column to the Place Database.

class AddLatAndLang < ActiveRecord::Migration
  def change
  	add_column :places, :latitude,  :float
  	add_column :places, :longitude, :float
  end
end
