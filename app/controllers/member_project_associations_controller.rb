class MemberProjectAssociationsController < ApplicationController
  before_action :set_project, only: [:assign_member, :assign_manager]
  before_action :set_member, only: [:assign_member, :assign_manager]

  def assign_member
    association = MemberProjectAssociation.new(project: @project,
                                               team_member: @member,
                                               )
    if association.save
     redirect_to project_path(@project)
    end
  end

  def assign_manager
    association = MemberProjectAssociation.new(project: @project,
                                               team_member: @member,
                                               project_manager: true
                                               )
    if association.save
      redirect_to project_path(@project)
    end
  end

  private

  def set_project
    @project = Project.find(params[:project_id])
  end

  def set_member
    @member = TeamMember.find(params[:member_id])
  end

end
