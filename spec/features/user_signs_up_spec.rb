require 'spec_helper'

feature 'user signs up', %Q{

As a registered user
I want to sign in
so that I can access the website
} do
# Acceptance Criteria:
# *I must enter my email and password
# *If I enter the information correctly, I am authenticated and logged in
# *If I enter incorrect information, I am presented with errors

scenario 'user enters valid information' do 
  visit new_user_registration_path
  click_link 'Sign Up'
  fill_in 'Username', with: 'Lizrtyi5'
  fill_in 'Email', with: 'example@example.com'
  fill_in 'user_password', with: '12345678'
  fill_in 'Password confirmation', with: '12345678'
  click_button 'Sign Up'


  #expect(page).to have_content 'Welcome! You have signed up successfully.'
  end

 scenario 'user does not enter vaild information' do
  visit root_path
  click_link 'Sign Up'
  click_button 'Sign Up'

  expect(page).to have_content("can't be blank")
  expect(page).to_not have_content("Sign Out")

 end

scenario 'with a conflicting password' do
  visit root_path
  click_link 'Sign Up'
  fill_in 'user_password', with: 'password'
  fill_in 'Password confirmation', with: 'Somethingdifferent'
  click_button 'Sign Up'
  expect(page).to have_content("doesn't match")
  expect(page).to_not have_content("Log Out")
 end
end

