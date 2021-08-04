require 'rails_helper'

RSpec.describe 'competitions index page' do
  before :each do
    @competition_1 = Competition.create!(name: 'Mens Regional', location: 'Louisville', sport: 'basketball')
    @competition_2 = Competition.create!(name: 'Allstar Game', location: 'Denver', sport: 'baseball')
    @competition_3 = Competition.create!(name: '2021 COPA America Cup', location: 'Rio', sport: 'soccer')

    visit("competitions/")
  end

  it 'displays the names of all competitions as links' do
    # User Story 1 - Competition Index
    #
    # As a user
    # When I visit the competion index
    # Then I see the names of all competitions
    # Each competition name links to its show page

    expect(page).to have_link(@competition_1.name)
    expect(page).to have_link(@competition_2.name)
    expect(page).to have_link(@competition_3.name)
  end

  it 'links to a competitions show page' do
    click_link("#{@competition_1.name}")

    expect(current_path).to eq("/competitions/#{@competition_1.id}")
  end
end
