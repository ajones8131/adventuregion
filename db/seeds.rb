# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

places = [{:name => 'Pikes Peak',         :placeid => '1', :category => 'Hiking',   :price => 'Low' ,   :popularity => 'Medium', :latitude => 38.84087, :longitude => -105.04226},
      {:name =>  'Blodgett Peak',         :placeid => '2', :category => 'Hiking',   :price => 'Free',   :popularity => 'Low',    :latitude => 38.95608, :longitude => -104.90660},
      {:name =>  'Mt Rosa',               :placeid => '3', :category => 'Hiking',   :price => 'Free',   :popularity => 'Low',    :latitude => 38.75415, :longitude => -104.94803},
      {:name =>  'Cheyenne Canyon',       :placeid => '4', :category => 'Hiking',   :price => 'Free',   :popularity => 'Medium', :latitude => 38.79222, :longitude => -104.88582},
      {:name =>  'Go-kart Racing',        :placeid => '5', :category => 'Fun',      :price => 'Medium', :popularity => 'High',   :latitude => 38.98558, :longitude => -104.43116},
      {:name =>  'Harmony Bowl',          :placeid => '6', :category => 'Fun',      :price => 'Low',    :popularity => 'High',   :latitude => 38.88822, :longitude => -104.75529},
      {:name =>  'All-Star Paintball',    :placeid => '7', :category => 'Shooting', :price => 'Medium', :popularity => 'High',   :latitude => 38.84971, :longitude => -104.56116},
      {:name =>  'Dragonmans (shooting)', :placeid => '8', :category => 'Shooting', :price => 'Low',    :popularity => 'High',   :latitude => 38.84971, :longitude => -104.56116}
  ]

places.each do |place|
  Place.create!(place)
end