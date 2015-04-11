class PlaceController < ApplicationController

  def index
    ordering, @type_header = {:category => :asc}, 'hilite'
    #@places = Place.order(ordering)

    @allCategories = Place.getCategories

    @selectedCategory = params[:category] || session[:category] ||{}
    if  @selectedCategory == {}
      @selectedCategory = Hash[@allCategories.map{|category| [category, category]}]
    end

    if params[:category] != session[:category]
      session[:category] = @selectedCategory
      redirect_to :category => @selectedCategory and return
    end
    @places = Place.where(category: @selectedCategory.keys).order(ordering)
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
