require 'spec_helper'
require 'rails_helper'

feature 'Add new Place' do
  before do
    visit '/place'
    click_link "Add a place"
  end
  scenario 'Create new place and Show page' do
    fill_in 'place_name', with: "Pikes Peak"
    fill_in 'place_category', with: "Hiking"
    select "Low", :from => "place_price"
    select "Medium", :from => "place_popularity"
    click_button "Create Place"
    expect(page).to have_content("Pikes Peak")
  end
end