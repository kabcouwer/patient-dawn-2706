class CompetitionTeamsController < ApplicationController
  def create
    @competition = Competition.find(params[:competition_id])
    team = Team.create(competition_team_params)
    comp_team = CompetitionTeam.create(competition: @competition, team: team)
    redirect_to "/competitions/#{@competition.id}"
  end

  private
  def competition_team_params
    params.permit(:hometown, :nickname)
  end
end
