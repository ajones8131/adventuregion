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

# require 'spec_helper'
# describe PlaceController, type: :controller do
#   describe 'Creating New Place:' do
#     it 'Should be possible to create new places with a name, category, price, popularity, latatude, and longitude' do
#       place = double('Pikes Peak', :name => 'Pikes Peak', :category => 'Hiking', :price => 'Low', :popularity => 'Medium')

#       Place.should_receive(:new).and_return(place)

#       post :new, { :place => place }
#     end
#   end

  # describe 'View Movies information' do
  #   it 'Should find movies with same director when searching for a copy of that movie/ similar movie' do
  #     first = mock('Movie', :director => 'director')
  #     copy = [mock('Movie'), mock('Movie')]

  #     Movie.should_receive(:find).with('42').and_return(first)
  #     Movie.should_receive(:find_all_by_director).with(first.director).and_return(copy)

  #     get :similar, { :id => '42' }
  #   end
  #   it 'Should redirect to home page if searching for similar movies of a movie without a director' do
  #     movie = mock('Movie', :title => 'No director', :director => nil)

  #     Movie.stub(:find).and_return(movie)

  #     get :similar, { :id => '13' }
  #     response.should redirect_to(movies_path)
  #   end
  # end

  # describe 'Editing Movies information:' do
  #   it 'Should find data of selected movie' do
  #     Movie.should_receive(:find).with('42')
  #     get :edit, { :id => '42' }
  #   end
  #   it 'Should update data when requested' do
  #     movie = mock('Movie', :title => 'Fake', :director => 'Fake Director')
  #     movie.stub(:update_attributes!)

  #     Movie.stub(:find).and_return(movie)
  #     movie.should_receive(:update_attributes!)

  #     post :update, { :id => '42', :movie => mock('Movie') }
  #   end
  # end

  # describe 'Sorting and Filtering Movies:' do
  #   it 'Should be possible to sort by title' do
  #     get :index, { :sort => 'title' }
  #   end
  #   it 'Should be possible to sort by release date' do
  #     get :index, { :sort => 'release_date' }
  #   end
  #   it 'Should be possible to filter movies based on ratings' do
  #     get :index, { :ratings => {:G => 1} }
  #     response.should redirect_to(movies_path(:ratings => { :G => 1 }))
  #   end
  # end
# end