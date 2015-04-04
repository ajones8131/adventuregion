class PlaceController < ApplicationController

  def index
    @places = Place.all
  end

	def show
    id = params[:id]
		@place = Place.find(params[:id]) # look up place by unique ID
	end

  def create
    @place = Place.new
  end

  def new
    @place = Place.new(place_params)
    @place.save
    redirect_to :action => "index"
  end

  def edit
    @place = Place.find params[:id]
  end

  def update
    @place = Place.find params[:id]
    @place.update_attributes!(place_params)
    flash[:notice] = "#{@place.name} was successfully updated."
    redirect_to place_path(@place)
  end

  #def destroy
  #  @place = Place.find(params[:placeid])
  #  @place.destroy
  #  flash[:notice] = "#{@place.name} was deleted"
  #end

	def place_params
		params.require(:place).permit(:name, :placeid, :category, :price, :popularity)
  end

end
