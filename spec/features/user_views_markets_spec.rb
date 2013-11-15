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
    FactoryGirl.create(:market, user_id: user.id, name: 'Dewey Square')
    visit markets_path
    expect(page).to have_content('Dewey Square')
   
    
  end
end
