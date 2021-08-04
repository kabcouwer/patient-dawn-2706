require 'rails_helper'

RSpec.describe 'competition show page' do
  before :each do
    @competition_1 = Competition.create!(name: '2021 COPA America Cup', location: 'Rio', sport: 'Soccer')
    @competition_2 = Competition.create!(name: 'Allstar Game', location: 'Denver', sport: 'Baseball')

    @team_1 = Team.create!(hometown: 'Mexico', nickname: 'El Tri')
    @team_2 = Team.create!(hometown: 'Brazil', nickname: 'Canarinho')
    @team_3 = Team.create!(hometown: 'USA', nickname: 'Stars and Stripes')
    @team_4 = Team.create!(hometown: 'Denver', nickname: 'Rockies')


    @player_1 = @team_1.players.create!(name: 'Diego Lainez', age: 23)
    @player_2 = @team_1.players.create!(name: 'Efrain Alvarez', age: 26)
    @player_3 = @team_2.players.create!(name: 'Neymar', age: 29)
    @player_4 = @team_3.players.create!(name: 'Christian Pulisic', age: 24)
    @player_5 = @team_3.players.create!(name: 'Tim Ream', age: 30)

    @competition_team_1 = CompetitionTeam.create(competition_id: @competition_1.id, team_id: @team_1.id)
    @competition_team_2 = CompetitionTeam.create(competition_id: @competition_1.id, team_id: @team_2.id)
    @competition_team_3 = CompetitionTeam.create(competition_id: @competition_1.id, team_id: @team_3.id)
    @competition_team_4 = CompetitionTeam.create(competition_id: @competition_2.id, team_id: @team_4.id)

    visit("competitions/#{@competition_1.id}")
  end

  it 'displays the competitions name, location, sport' do
    expect(page).to have_content(@competition_1.name)
    expect(page).to have_content(@competition_1.location)
    expect(page).to have_content(@competition_1.sport)
  end

  it 'displays the nickname and hometown of all teams' do
    within "#team-#{@team_1.id}" do
      expect(page).to have_content(@team_1.hometown)
      expect(page).to have_content(@team_1.nickname)
    end

    within "#team-#{@team_2.id}" do
      expect(page).to have_content(@team_2.hometown)
      expect(page).to have_content(@team_2.nickname)
    end

    within "#team-#{@team_3.id}" do
        expect(page).to have_content(@team_3.hometown)
        expect(page).to have_content(@team_3.nickname)
    end

    expect(page).to have_no_content(@team_4.hometown)
    expect(page).to have_no_content(@team_4.nickname)
  end

  it 'displays the average age of all players in the competition' do
    expect(page).to have_content("Average age of all players: 26.9")
  end
end
