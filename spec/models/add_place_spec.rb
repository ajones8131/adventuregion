require 'spec_helper'
require 'rails_helper'

feature 'Add new Place' do
  before do
    visit '/place/index'
    click_link "Add new place"
  end
  scenario 'Create new place' do
    fill_in 'place_name', with: "Pikes Peak"
    fill_in 'place_placeid', with:	"1000"
    fill_in 'place_category', with: "Hiking"
    fill_in 'place_price', with: "low"
    fill_in 'place_popularity', with: "medium"
    click_button "Create Place"
    expect(page).to have_content("Pikes Peak")
  end
end