require 'spec_helper'


feature 'user views all locations'  
  scenario 'locations are displayed with valid information' do
    stub_geocoding_request 'Boston, MA'

    boston_location = create(:location, in_boston)

    locations = LocationsOnPage.new
end