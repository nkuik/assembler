class AddPhotoToTeamMember < ActiveRecord::Migration[5.0]
  def change
    add_column :team_members, :photo, :string
  end
end
