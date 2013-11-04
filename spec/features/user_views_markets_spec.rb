require 'spec_helper'

feature "user views farmers markets", %Q{
  As a User
  I want to view a list of farmers markets
  So that I can see what markets are on the site
} do
# - I see list of all of the farmers markets in the database
# - I see the farmers markets paginated by 10 per page
# - I see them in Alphabetical order

  scenario 'user views all the farmers markets' do
    user = FactoryGirl.create(:user)
    visit markets_path
    Market.create(name: 'Boston')
    prev_count = Market.count
    #expect(Market.count).to eql(prev_count + 1)
    #expect(page).to have_content('Hingham')
   
    
  end
end
