require 'spec_helper'

feature 'user recommends a posting', %Q{
  As an authenticated user
  I want to recommend on a posting
  So that I can let others know about must-read postings
  } do

  # Acceptance Criteria
  # I can only recommend a posting once
  # I can see that I added a recommendation

  scenario 'user recommends a posting' do
    user = FactoryGirl.create(:user)
    market = FactoryGirl.create(:market, user_id: user.id )

    prev_count = Recommendation.count


    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log In'

    visit markets_path
    click_button 'Recommend'

    expect(Recommendation.count).to eql(prev_count + 1)
    expect(page).to have_content("You recommended #{posting.title}")
    expect(Recommendation.last.user_id).to eql(user.id)
    expect(Recommendation.last.posting_id).to eql(posting.id)
  end

end