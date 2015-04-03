class CreatePlaces < ActiveRecord::Migration
  def change
    create_table :places do |t|
      t.string :name
      t.string :placeid
      t.text :type
      t.datetime :price
      t.text :popularity
      # Add fields that let Rails automatically keep track
      # of when project tasks are added or modified:
      t.timestamps
    end
  end

  #def down
  #  drop_table :places
  #end

end
