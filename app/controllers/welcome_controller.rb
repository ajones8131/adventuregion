class WelcomeController < ApplicationController
  def index
  	ordering, @type_header = {:name => :asc}, 'hilite'
    @places = Place.order(ordering)
  end
  
  def place
  end
  
end
