class MemberProjectAssociation < ApplicationRecord
  belongs_to :team_member
  belongs_to :project
end
