require 'rails_helper'
require 'spec_helper'

RSpec.describe SessionsController, :type => :controller do

	before do
		@user = User.new(name: "Group3", email: "group3@example.com",
                     password: "foobar", password_confirmation: "foobar")
	end

	describe "sign in" do 

		let :credentials do 
			{ :email => 'group3@example.com', :password => 'foobar' }
		end

		before :each do 
			visit signin_path
			post sign_in, credentials
		end

		it "Successful user sessions and sign in" do
			expect(session[:id]).to eq(user.id)
			expect(page).to have_content("#{user.name}")
		end

		let :credentials do 
			{ :email => 'group3@example.com', :password => 'wrongpwd' }			
		end

		before :each do
			visit signin_path
			post sign_in, credentials
		end

		it "Unsuccessful user session and sign in" do
			expect(session[:id]).to eq(nil)
			expect(page).to have_selector('div.alert.alert-error')
			expect(page).to have_content('Invalid email/password combination')
			expect(page).to have_content("Sign In")	
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