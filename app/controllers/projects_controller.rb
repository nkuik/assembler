class ProjectsController < ApplicationController
  before_action :set_project, only: [:show]

  def index
    @projects = Project.all
  end

  def show
    @team_members = TeamMember.all
    @member_associations = MemberProjectAssociation.where(project_id: @project.id) 
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

end
