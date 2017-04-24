class Match < ApplicationRecord
  belongs_to :team_member, inverse_of: :match
  belongs_to :project

  def recalculate_match_score
  end

  def essential_role
  end
end
