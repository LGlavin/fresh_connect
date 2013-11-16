# require 'spec_helper'

# feature "create a market", %Q{
#   As an authenticated user
#   I want to create a market
#   So that people can find markets  
# } do

# scenario "user creates a market with vaild information" do 
#   user = FactoryGirl.create(:user)
#   market = FactoryGirl.create(:market, user_id: user.id)

#   sign_in_as(user)

#   visit "markets/#{markets.id}"
#   prev_count = Market.prev_count

#   fill_in 'Name', with 'Scituate Farmers Market'
#   fill_in 'City', with 'Scituate, MA'
#   fill_in 'Datetime', with 'Monday'
#   click_button 'Create Market'

#   expect(Market.count).to eql(prev_count + 1)
#   expect(page).to have_content("Market was created successfully!")
# end