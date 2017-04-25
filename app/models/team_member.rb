class TeamMember < ApplicationRecord
  has_one :skill
  has_many :matches
  has_many :member_project_associations
  # belongs_to :project_team

  mount_uploader :photo, PhotoUploader

  scope :developers, -> { joins(:skill).where(skills: { skill_category: "web development" }) }
  scope :designers, -> { joins(:skill).where(skills: { skill_category: "design" }) }
  scope :creatives, -> { joins(:skill).where(skills: { skill_category: "creative development" }) }
  scope :businessers, -> { joins(:skill).where(skills: { skill_category: "business development" }) }

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
    ["design",
     "web development",
     "business development",
     "creative development",
     "not applicable"
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
     "affinity photo",
     "not applicable"
    ]
  end

  def possible_tech_categories
    ["web",
     "photo",
     "video",
     "not applicable"
    ]
  end

  def possible_education_types
    ["traditional",
     "non-traditional"
    ]
  end

end
