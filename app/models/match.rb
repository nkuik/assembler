class Match < ApplicationRecord
  belongs_to :team_member, inverse_of: :match
  belongs_to :project

  def calculate_match_score
    # probably just summing bunch of sub methods
    # any project role needs?
      # order those with necessary skills at top
    #
  end
end
