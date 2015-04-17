class Place < ActiveRecord::Base
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
