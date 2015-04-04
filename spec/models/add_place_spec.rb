require 'spec_helper'
require 'rails_helper'

feature 'Add new Place' do
  before do
    visit '/place/index'
    click_link "Add a place"
  end
  scenario 'Create new place and Show page' do
    fill_in 'place_name', with: "Pikes Peak"
    fill_in 'place_category', with: "Hiking"
    fill_in 'place_price', with: "low"
    fill_in 'place_popularity', with: "medium"
    click_button "Create Place"
    expect(page).to have_content("Pikes Peak")
    click_link "Pikes Peak"
    expect(page).to have_content("Showing Details for Pikes Peak")
    expect(page).to have_content("Category = Hiking")
    expect(page).to have_content("Price = low")
    expect(page).to have_content("Popularity = medium")
    expect(page).to have_content("Showing Details for Pikes Peak")
  end
end

#feature 'Edit Place' do
 # before do
 #   @place = Place.create(name:"Pikes Peak", placeid:"1000", category:"Hiking", price:"low", popularity:"medium")
 # end
 # scenario 'Edit Pikes Peak' do
 #   
 # end
#end
