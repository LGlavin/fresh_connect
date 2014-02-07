require 'spec_helper'

feature 'user signs in', %Q{
  As an unauthenticated user
  I want to sign in
  So I can use the site
} do 

scenario 'user with valid information can sign in' do
    user = FactoryGirl.create(:user)
    visit root_path
    click_link 'Log In'

    page.should have_content("Log In")

    fill_in 'user_email', with: user.email 
    fill_in 'user_password', with: user.password 

    click_button 'Log In'

    page.should have_content('Log Out')

    page.should_not have_content('Log In')
    page.should have_content('Signed in successfully.')
  end

  scenario 'a non-existant email and password are supplied' do 
    visit root_path
    click_link 'Log In'

    fill_in 'Email', with: 'nobody@example.com'
    fill_in 'Password', with: 'password'
    
    click_button 'Log In'

    #expect(page).to have_content('Invalid email or password.')
    
    expect(page).to_not have_content('Welcome back!')
    expect(page).to_not have_content('Log out')
  end

  scenario 'an existing email with the wrong password is denied' do
    user = FactoryGirl.create(:user)
    visit root_path
    
    click_link 'Log In'
    
    fill_in 'Email', with: user.email
    fill_in 'Password', with: 'incorrectpassword'
    
    click_button 'Log In'

    #expect(page).to have_content('Invalid email or password.')
    expect(page).to_not have_content('Log out')
  end

end