require 'spec_helper'

feature 'user creates a new market', %Q{
  As a user
  I want to create a market
  So others can view the market
} do 

  scenario 'create a new market with valid info' do 
    user = FactoryGirl.create(:user)
    
    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log In'
    
    market = FactoryGirl.create(:market)
    prev_market_count = Market.count 
    visit new_market_path
   

    fill_in :market_name, with: market.name
    fill_in :market_address, with: market.address
    fill_in :market_description, with: market.description
    

    click_button 'Create Market'
    expect(Market.count).to eql(prev_market_count + 1)


    expect(page).to have_content('You created a market successfully!')
  end

  scenario 'create a new market with invalid info' do
    user = FactoryGirl.create(:user)
    
    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log In'
    
    market = FactoryGirl.create(:market)
    prev_market_count = Market.count 
    visit new_market_path
   
    click_button 'Create Market'
    expect(Market.count).to eql(prev_market_count + 1)
    expect(page).to have_content("You failed to a make a market")
  end
end