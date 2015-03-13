class PlaceController < ApplicationController

	def show
		placeid = params[:placeid] # retrieve place ID from URI route
		@place = Place.find(placeid) # look up place by unique ID
	end

	def index
		
	end


  def create
    @place=Place.create!(place_params)
    flash[:notice] = "#{@place.name} was successfully created."
  end

  def destroy
    @place = Place.find(params[:placeid])
    @place.destroy
    flash[:notice] = "#{@place.name} was deleted"
  end

	def place_params
		params.require(:place).permit(:placeid, :name, :type, :price, :popularity)
  end
end
