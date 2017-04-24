class Project < ApplicationRecord
  has_one :project_team
  has_one :project_requirement
  has_many :matches
  has_many :member_project_associations


  def down_to_wire
    deadline <= Date.today + 30
  end
end
