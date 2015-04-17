require 'rails_helper'
require 'spec_helper'

describe "Authentication" do

  subject { page }

  describe "signin page" do
    before { visit signin_path }
    
    it { should have_content('Sign in') }
    it { should have_title('Sign in') }
  end

  describe "signin" do
    before { visit signin_path }
    
    describe "with invalid information" do
      before { click_button "Sign in" }
      
      it { should have_title('Sign in') }
      it { should have_content('Sign up now!') }

    end

    describe "with valid information" do
      before do
       @user = User.create(name: "Group3", email: "group3@example.com",
                     password: "foobar", password_confirmation: "foobar")

        fill_in "Email",    with: @user.email
        fill_in "Password", with: @user.password
        click_button "Sign in"
      end
      
      it { should have_content(@user.name) }
      it { should have_content('Sign Out') }
      it { should have_content('Group3') }
      it { should_not have_content('Sign in') }

    end
  end
end