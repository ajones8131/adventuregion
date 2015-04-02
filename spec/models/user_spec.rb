require 'rails_helper'
require 'spec_helper'


describe User do 

	before do
		@user = User.new(name: "group3", email: "group3@random.com",
						password: "foobar", password_confirmation: "foobar")
	end

	subject { @user }

	it { should respond_to(:name) }
	it { should respond_to(:email) }
	it { should respond_to(:password_digest) }
	it { should respond_to(:password) }
	it { should respond_to(:password_confirmation) }

	describe "when name is not present" do
		before { @user.name = " "}
		it {should_not be_valid}
	end

	describe "when email is not present" do
		before { @user.email = " "}
		it {should_not be_valid}
	end

	describe "when password confirmation is nil" do 
		before { @user.password_confirmation = nil}	
		it { should_not be_valid}
	end

	#Last two WILL FAIL right now.
	describe "with valid password" do 
		it { should == found_user.authenticate(@user.password)}
	end

	describe "with invalid password" do 
		let (:user_for_invalid_password) { found_user.authenticate("invalid")}

		it { should_not == user_for_invalid_password }
		specify {expect(user_for_invalid_password).to be_false}
	end

end