# Place Controller for the Databases populated with places/locations.

class PlaceController < ApplicationController

  def index
    #ordering, @type_header = {:category => :asc}, 'hilite'
    #@places = Place.order(ordering)
    @places = Place.all

    index_information
    

    params.slice(:category, :price, :popularity).each do |key, value|
      @places = @places.public_send(key, value)if value.present?
    end
  end

  def index_information
    @all_categories = Place.get_categories
    @all_prices = Place.get_price
    @all_popularities = Place.get_popularity
  end

	def show
    # Andrew: Old Code Before Reek: PlaceController#filtering_params refers to params more than self (FeatureEnvy)
    # id = params[:id]
		# @place = Place.find(params[:id]) # look up place by unique ID

    # New code for Reek
    id = params[:id]
    @place = Place.find(id) # look up place by unique ID
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
		params.require(:place).permit(:name, :placeid, :category, :price, :popularity, :latitude, :longitude)
  end

  #private
  #def filtering_params(params)
  #  params.slice(:category, :price, :popularity)
  #end

end
