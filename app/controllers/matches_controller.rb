class MatchesController < ApplicationController
  before_action :set_project, only: [:create_matches]

  def create_matches
    @team_members = TeamMember.all
    if match_score_router(@team_members)
      redirect_to project_path(@project)
    else
      render root_path
    end
  end

  private

  def set_project
    @project = Project.includes(:project_requirement).find(params[:project_id])
  end

  def match_score_router(team_members)
    team_members.each do |member|
      if match_exist?(member.matches)
        recalculate_match_score(member)
      else
        calculate_match_score(member)
      end
    end
  end

  def match_exist?(matches)
    exist = false
    matches.each {|match| exist = true if match.project_id == @project.id }
    exist
  end

  def calculate_match_score(member)
    match = Match.new(team_member_id: member.id,
                      project_id: @project.id,
                      score: 0)
    account_project_needs(member, match)
    account_project_status(member, match)
    account_experience(member, match)
    account_education(member, match)
    match.save
  end

  def recalculate_match_score(member)
    match = member.matches.where(project_id: @project_id).first
    match.score = 0
    account_project_needs(member. match)
    account_project_status(member, match)
    account_experience(member, match)
    account_education(member, match)
    match.update
  end

  def account_project_needs(member, match)
    if @project.project_requirement.essential_role_needs.include?(member.skill.skill_category)
      match.score += 5
    end
    match
  end

  def account_project_status(member, match)
    if @project.down_to_wire and member.skill.years_experience > 1
      match.score += 2
    end
    match
  end

  def account_experience(member, match)
    if @project.project_requirement.size.include?("medium") or @project.project_requirement.size.include?("large")
      match.score += 2 if member.skill.years_experience >= 2
    end
    match
  end

  def account_education(member, match)
      if @project.project_requirement.size.include?("medium") or @project.project_requirement.size.include?("large") or @project.down_to_wire
        match.score += 2 if member.skill.education_type == "traditional"
      end
  end

end
