require 'spec_helper'

feature 'User searches by postal code', %Q{
As a registered User
I want to search for markets
So I know when they are occuring
} do 

  scenario 'display locations from the search' do
    stub_geocoding_request 'Scituate, MA'
    stub_geocoding_request 'Boston, Ma', 42.35548199999999, -71.0608386
  
    scituate_location = create(:location, :in_scituate)
    boston_location = create(:location, :in_boston)

    locations = LocationsOnPage.new
    locations.search boston_location.postal_code

    expect(locations).to include(boston_location)
  end 
  
end