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
  fill_in 'Username', with: 'Lizrtyi5'
  fill_in 'Email', with: 'example@example.com'
  fill_in 'password', with: '12345678'
  fill_in 'password_confirmation', with: '12345678'
  click_link 'sign up'

  #expect(page).to have_content 'Welcome! You have signed up successfully.'
  end

 scenario 'user does not enter vaild information' do
  visit new_user_registration_path
  click_link 'sign up'
  #expect(page).to have_content("can't be blank")

 end

scenario 'with a conflicting password' do
  visit new_user_registration_path
  fill_in 'password', with: 'password'
  #fill_in 'Password Confirmation', with: 'Something different'
  click_link 'sign up'
  expect(page).to have_content("doesn't match")
 end
end

