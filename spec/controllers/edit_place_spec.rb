require 'spec_helper'
require 'rails_helper'

feature 'Edit Existing Place' do
  before do
    visit '/place'
    click_link "Add a place"
    fill_in 'place_name', with: "Pikes Peak"
    fill_in 'place_category', with: "Hiking"
    select "Low", :from => "place_price"
    select "Medium", :from => "place_popularity"
    click_button "Create Place"
    click_link "Pikes Peak"
    click_link "Edit Record"
  end
  scenario 'Edit Pikes Peak' do
    fill_in 'place_name', with: "Pikes Peak Trail"
    click_button "Update Place"
    expect(page).to have_content("Pikes Peak Trail")
  end
end