# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
places = [{:name => 'Pikes Peak',         :placeid => '1', :category => 'Hiking',   :price => 'low' ,   :popularity => 'medium'},
      {:name =>  'Blodgett Peak',         :placeid => '2', :category => 'Hiking',   :price => 'free',   :popularity => 'low'},
      {:name =>  'Mt Rosa',               :placeid => '3', :category => 'Hiking',   :price => 'free',   :popularity => 'low'},
      {:name =>  'Cheyenne Canyon',       :placeid => '4', :category => 'Hiking',   :price => 'free',   :popularity => 'medium'},
      {:name =>  'Go-kart Racing',        :placeid => '5', :category => 'Fun',      :price => 'medium', :popularity => 'high'},
      {:name =>  'Harmony Bowl',          :placeid => '6', :category => 'Fun',      :price => 'low',    :popularity => 'high'},
      {:name =>  'All-Star Paintball',    :placeid => '7', :category => 'Shooting', :price => 'medium', :popularity => 'high'},
      {:name =>  'Dragonmans (shooting)', :placeid => '8', :category => 'Shooting', :price => 'low',    :popularity => 'high'}
  ]

places.each do |place|
  Place.create!(place)
end
#Place.create("name" => "Pikes Peak", "placeid" => "1", "category" => "", "price" => "low", "popularity" => "medium")