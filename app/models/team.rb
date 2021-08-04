class Team < ApplicationRecord
  has_many :players
  has_many :competition_teams
  has_many :competitions, through: :competition_teams

  def self.all_players_average_age
    all.sum do |team|
      (team.players.average_age.to_f / all.length).round(1)
    end
  end
end
