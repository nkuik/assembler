class ProjectsController < ApplicationController
  before_action :set_project, only: [:show]

  def index
    @projects = Project.all
  end

  def show
    @project_team
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
