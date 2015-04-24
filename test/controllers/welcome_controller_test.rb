require 'test_helper'

# Default Rails generated test file for Welcome Controller - Rspec is used instead for testing
class WelcomeControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

end
