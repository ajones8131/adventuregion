require 'rails_helper'
require 'spec_helper'

RSpec.describe SessionsController do

	subject { page }

	before do
		@user = User.new(name: "Group3", email: "group3@example.com",
                     password: "foobar", password_confirmation: "foobar")
	end

	describe "sign in" do 

		before :each do 
			visit signin_path
			signin @user
		end

		it "Successful user sessions and sign in" do
			expect(email => params[:session][:email]).to eq(user.email)
			expect(password => params[:session][:password]).to eq(user.password)
			expect(session[:id]).to eq(user.id)
			expect(page).to have_content("#{user.name}")
		end

		before :each do
			visit "/signin"
			signin @user
		end

		it "Unsuccessful user session and sign in" do
			expect(response).to 
			response.should_not be_success
			expect(session[:id]).to eq(nil)
			expect(page).to have_content('Invalid email/password combination')
			expect(page).to have_content("Sign In")	
		end		
	end

	describe "sign out" do
		before :each do 
			visit "/signin"
			signin @user
		end

		it "should sign out a user" do
			delete :destroy
  			request.original_url.eq signin_path
			expect(page).to have_content("Sign In")
			expect(page).to have_content("Sign up now!")
		end	
	end
end