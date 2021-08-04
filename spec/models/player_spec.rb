require 'rails_helper'

RSpec.describe Player do
  describe 'relationships' do
    it { should belong_to(:team) }
  end

  describe '.class_methods' do
    before :each do
      @team_1 = Team.create!(hometown: 'Mexico', nickname: 'El Tri')
      @team_2 = Team.create!(hometown: 'Brazil', nickname: 'Canarinho')
      @team_3 = Team.create!(hometown: 'USA', nickname: 'Stars and Stripes')


      @player_1 = @team_1.players.create!(name: 'Diego Lainez', age: 23)
      @player_2 = @team_1.players.create!(name: 'Efrain Alvarez', age: 26)
      @player_3 = @team_2.players.create!(name: 'Neymar', age: 29)
      @player_4 = @team_3.players.create!(name: 'Christian Pulisic', age: 24)
      @player_5 = @team_3.players.create!(name: 'Tim Ream', age: 30)
    end

    describe '.average_age' do
      it 'can find the average age of all players' do
        # binding.pry
        expect(Player.average_age).to eq(26.4)
      end
    end
  end
end
