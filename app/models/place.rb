# Models the Place Database with Categories, Prices, and Popularity options

class Place < ActiveRecord::Base
  scope :category, -> (category) { where category: category }
  scope :price, -> (price) { where price: price }
  scope :popularity, -> (popularity) { where popularity: popularity }

  def self.getCategories
    categories = Set.new
    self.all.each do |place|
      categories << place.category
    end
    categories.to_a
  end

  def self.getPrice
    return ['Free', 'Low', 'Medium', 'High']
  end

  def self.getPopularity
    return ['Free', 'Low', 'Medium', 'High']
  end
end
