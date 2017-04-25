class ProjectRequirement < ApplicationRecord
  belongs_to :project

  class << self
    def possible_varieties
      ["mvp",
       "second version",
       "overhaul",
       "polishing"
      ]
    end

    def possible_sizes
      ["small",
       "medium",
       "large"
      ]
    end

    def possible_lengths
      ["short",
       "medium",
       "long"
      ]
    end

    def possible_client_types
      ["enterprise",
       "creative agency",
       "small business"
      ]
    end
  end

  def essential_role_needs
    if project.member_project_associations.empty?
      ["design", "web development"]
    else
      needs = []
      needs << "web development" if project.member_project_associations.map {|assoc| assoc.team_member.skill.skill_category == 'web development'}.empty?
      needs << "design" if project.member_project_associations.map {|assoc| assoc.team_member.skill.skill_category == 'design'}.empty?
      needs
    end
  end

end
