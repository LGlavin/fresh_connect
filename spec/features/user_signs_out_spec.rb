require 'spec_helper'

feature 'user signs out', %Q{
  As an authenticated user
  I want to sign out
  because the I want to 
} do 

  scenario 'a registered user can sign out' do 

    user = FactoryGirl.create(:user)
    sign_in_as(user)

    visit root_path
    click_link 'Log Out'

    expect(page).to have_content('Signed out successfully.')
    expect(page).to have_content('Log In')

    expect(page).to_not have_content('Log Out')
  end

  scenario 'a non signed in user can not sign out' do 
    visit root_path 

    expect(page).to_not have_content('Log Out')
  end
end