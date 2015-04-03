class PlaceController < ApplicationController

  def index
    @places = Place.all
  end

	def show
		@place = Place.find(params[:id]) # look up place by unique ID
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
		params.require(:place).permit(:name, :placeid, :type, :price, :popularity)
  end
end
