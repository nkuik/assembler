class CreateProjectTeams < ActiveRecord::Migration[5.0]
  def change
    create_table :project_teams do |t|
      t.references :project
      t.text :members, array: true, default: []

      t.timestamps
    end
  end
end
