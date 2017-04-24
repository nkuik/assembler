class MemberProjectAssociation < ApplicationRecord
  belongs_to :team_member
  belongs_to :project

  scope :managers, -> { where(project_manager: true) }
end
