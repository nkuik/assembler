class MemberSkill < ApplicationRecord
  belongs_to :team_member

  class << self
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
  end
end
