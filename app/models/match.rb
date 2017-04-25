class Match < ApplicationRecord
  belongs_to :team_member
  belongs_to :project

  def assigned_already?
    self.team_member.member_project_associations.select {|assoc| assoc.project_id == project.id }.any?
  end
end
