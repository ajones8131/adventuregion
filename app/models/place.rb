# Models the Place Database with Categories, Prices, and Popularity options

class Place < ActiveRecord::Base
  scope :category, -> (category) { where category: category }
  scope :price, -> (price) { where price: price }
  scope :popularity, -> (popularity) { where popularity: popularity }

  def self.get_categories
    categories = Set.new
    self.all.each do |place|
      categories << place.category
    end
  categories.to_a
  end
  def self.get_price
    return ['Free', 'Low', 'Medium', 'High']
  end

  def self.get_popularity
    return ['Low', 'Medium', 'High']
  end
end
