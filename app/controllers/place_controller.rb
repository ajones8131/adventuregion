class PlaceController < ApplicationController

	def show
		placeid = params[:placeid] # retrieve place ID from URI route
		@place = Place.find(placeid) # look up place by unique ID
	end

	def index
		@selectedPlace
	end

	def place_params
		params.require(:place).permit(:placeid, :name, :type, :price, :popularity)
  end
end
