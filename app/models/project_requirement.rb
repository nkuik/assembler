class ProjectRequirement < ApplicationRecord
  belongs_to :project

  class << self
    def possible_types
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
       "creative agency"
      ]
    end
  end

  def role_needs
    # return whatever of the three roles that
  end

end
