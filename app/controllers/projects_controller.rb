class ProjectsController < ApplicationController
  before_action :set_project, only: [:show]
  before_action :set_matches, only: [:show]

  def index
    @projects = Project.all
  end

  def show
    @member_associations = MemberProjectAssociation.where(project_id: @project.id)
    @developers = @member_associations.select {|assoc| assoc.team_member.skill.skill_category == 'web development' unless assoc.project_manager?}
    @designers = @member_associations.select {|assoc| assoc.team_member.skill.skill_category == 'creative development' or 'design' unless assoc.project_manager?}
    @businessers = @member_associations.select {|assoc| assoc.team_member.skill.skill_category == 'business development' unless assoc.project_manager?}
  end

  private

  def project_params
    params.require(:project).permit(:name,
                                    :client,
                                    :deadline
                                   )
  end

  def set_project
    @project = Project.includes(:matches,
                                :member_project_associations).find(params[:id])
  end

  def set_matches
    @matches = Match.order('score DESC').where(project_id: @project.id)
    @remaining_matches = @matches.select { |match| match unless match.assigned_already? }
    @designer_matches = @remaining_matches.select { |match| match.team_member.skill.skill_category == 'design' }
    @business_matches = @remaining_matches.select { |match| match.team_member.skill.skill_category == 'business development' }
    @developer_matches = @remaining_matches.select { |match| match.team_member.skill.skill_category == 'web development' }
  end

end
