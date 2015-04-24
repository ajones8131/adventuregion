# Database migration that creates the table for the Place Database.  It
# Populates the table with the timestamps

class CreatePlaces < ActiveRecord::Migration
  def change
    create_table :places do |table|
    	table.timestamps
    end
  end
end
