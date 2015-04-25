# Controller for the Home page of AdventuRegion. Includes Random Adventure Funtionality

class WelcomeController < ApplicationController

  helper_method :get_random

  def index
  	ordering, @type_header = {:name => :asc}, 'hilite'
    @places = Place.order(ordering)
  end
  
  def place
  end
end