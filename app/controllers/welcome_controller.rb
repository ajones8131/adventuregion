# Controller for the Home page of AdventuRegion. Includes Random Adventure Funtionality

class WelcomeController < ApplicationController

  helper_method :get_random

  def index
  	ordering, @type_header = {:name => :asc}, 'hilite'
    @places = Place.order(ordering)

    #@random = get_random
  end
  
  def place
  end

  def get_random
    id = rand(Place.all.length).round
    return Place.where(id + 1)
  end
end