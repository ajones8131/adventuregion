require 'spec_helper'
require 'rails_helper'

feature 'Show Existing Place' do
  before do
    visit '/place'
    click_link "Add a place"
    fill_in 'place_name', with: "Pikes Peak"
    fill_in 'place_category', with: "Hiking"
    select "Low", :from => "place_price"
    select "Medium", :from => "place_popularity"
    click_button "Create Place"
  end
  scenario 'Show Pikes Peak Details' do
    click_link "Pikes Peak"
    expect(page).to have_content("Showing Details for Pikes Peak")
    expect(page).to have_content("Category = Hiking")
    expect(page).to have_content("Price = Low")
    expect(page).to have_content("Popularity = Medium")
    expect(page).to have_content("Showing Details for Pikes Peak")
  end
end