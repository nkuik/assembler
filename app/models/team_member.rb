class TeamMember < ApplicationRecord
  has_one :member_skill
  has_many :matches
  # belongs_to :project_team

  mount_uploader :photo, PhotoUploader

end
