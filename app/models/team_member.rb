class TeamMember < ApplicationRecord
  has_one :member_skill
  has_many :matches
  # belongs_to :project_team

  mount_uploader :photo, PhotoUploader

  accepts_nested_attributes_for :member_skill

  def possible_skills
    ["backend development",
     "frontend development",
     "marketing",
     "ideation",
     "design",
     "web design",
     "photography",
     "project management",
     "brand dev",
     "strategy"
    ]
  end

  def possible_skill_categories
    ["web dev",
     "business dev",
     "creative dev",
    ]
  end

  def possible_techs
    ["php",
     "node",
     "react",
     "angular",
     "illustrator",
     "sketch",
     "invision",
     "affinity photo"
    ]
  end

  def possible_tech_categories
    ["web",
     "photo",
     "video"
    ]
  end

  def possible_education_types
    ["traditional",
     "non-traditional"
    ]
  end

end
