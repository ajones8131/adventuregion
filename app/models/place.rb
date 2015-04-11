class Place < ActiveRecord::Base
	def self.getCategories
		return ['Hiking', 'Fun', 'Shooting']
	end
end
