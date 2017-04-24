class MatchesController < ApplicationController

  def create
    @team_members = TeamMember.all
    calculate_match_score(@team_members)
  end

  private

  def calculate_match_score(team_members)
    team_members.each do |member|

    end
  end

end
