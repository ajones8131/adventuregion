class WelcomeController < ApplicationController
  def index
  	@places = Place.all
  end
  
  def place
  end
  
end
