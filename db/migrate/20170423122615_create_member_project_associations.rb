class CreateMemberProjectAssociations < ActiveRecord::Migration[5.0]
  def change
    create_table :member_project_associations do |t|
      t.references :team_member
      t.references :project
      t.boolean :project_manager, default: false

      t.timestamps
    end
  end
end
