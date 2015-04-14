require 'rails_helper'
require 'spec_helper'


RSpec.describe SessionsHelper, :type => :helper do 

	describe "Sign and Sign out " do

		it "signed in?" do
			expect(current_user).to eq(nil)
		end

		it "sign_out" do
			expect(current_user).to eq(nil)
		end	
	end
end