class WelcomeController < ApplicationController
  def index
  end

  def test
  	@current_time = Time.now
  end
end