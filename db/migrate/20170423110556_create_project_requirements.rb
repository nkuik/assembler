class CreateProjectRequirements < ActiveRecord::Migration[5.0]
  def change
    create_table :project_requirements do |t|
      t.references :project
      t.string :size
      t.string :type
      t.string :length
      t.string :client_type
      t.text :characteristics, array: true, default: []

      t.timestamps
    end
  end
end
