require 'rails_helper'
require 'spec_helper'

RSpec.describe SessionsController, :type => :controller do

	before do
		@user = User.new(name: "Group3", email: "group3@example.com",
                     password: "foobar", password_confirmation: "foobar")
	end

	describe "GET #new" do
		it "returns http success" do
		  get :new
		  expect(response).to have_http_status(:success)
		end
	end

	describe "#create" do 

		let :credentials do 
			{ :email => 'group3@example.com', :password => 'foobar' }
		end

		before :each do 
			post sign_in, credentials
		end

		it "creates a user sessions" do
			expect(session[:id]).to eq(user.id)
		end
	end

	describe "sign out" do
		before :each do 
			sign_in @user
		end

		it "should sign out a user" do
			delete signout_path
			get 'signin'
			expect(response).to be_success
			expect(page).to have_content("Sign In")			
		end			
	end
end