require 'rails_helper'
require 'spec_helper'


RSpec.describe SessionsHelper, :type => :helper do 

	describe "Sign and Sign out " do

		it "sign_in" do
			expect(:user_id).to eq(user.id)
		end 

		it "signed in?" do
			expect(current_user).to eq(nil)
		end

		it "current_user=" do
		expect(current_user).to eq(user)
		end

		it "sign_out" do
			expect(current_user).to eq(nil)
		end	

		it "redirect back to" do
			expect(response).to be_success
			expect(page).to have_content("Sign In")
		end
	end
end