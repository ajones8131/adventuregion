class WelcomeController < ApplicationController
  helper_method :get_random
  def index
  	ordering, @type_header = {:name => :asc}, 'hilite'
    @places = Place.order(ordering)
  end
  
  def place
  end

  def get_random
    id = rand(Place.all.length)
    return Place.find(id + 1)
  end
end