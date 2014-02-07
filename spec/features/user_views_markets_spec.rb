require 'spec_helper'

feature 'view all markets', %Q{
  As a market searcher
  I would like view the markets
  So I can see the markets
} do 

  scenario 'all markets are listed' do 
    visit markets_path

    Market.all.each do |market|
      expect(page).to have_content( market.name )
    end
  end
 
  # scenario 'pagination setting lists 10 markets at a time' do 
  #   visit markets_path
  #   expect(page).to have_content(markets.first.name)
  #   expect(page).to_not have_content(markets.last.name)

  #   click_link 'Last'
  #   expect(page).to have_content('First')
  #   expect(page).to have_content('Prev')

  #   expect(page).to have_content(markets.last.name)
  #   expect(page).to_not have_content(markets.first.name)

  # end
end