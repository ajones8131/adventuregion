class PlaceController < ApplicationController

  def index
    ordering, @type_header = {:category => :asc}, 'hilite'
    @places = Place.order(ordering)

    @allCategories = Place.getCategories
    @allPrices = Place.getPrice
    @allPopularities = Place.getPopularity

    # @places = @places.category(params[:category]) if params[:category].present?
    # @places = @places.price(params[:price]) if params[:price].present?
    # @places = @places.popularity(params[:popularity]) if params[:popularity].present?

    filtering_params(params).each do |key, value|
      @places = @places.public_send(key, value)if value.present?
    end
    # @places = Place.where(category: @selectedCategory.keys, price: @selectedPrice.keys).order(ordering)
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
		params.require(:place).permit(:name, :placeid, :category, :price, :popularity, :latitude, :longitude)
  end

  #private
  def filtering_params(params)
    params.slice(:category, :price, :popularity)
  end

end
