class ProjectTeam < ApplicationRecord
  belongs_to :project
  has_many :member_project_associations
end
