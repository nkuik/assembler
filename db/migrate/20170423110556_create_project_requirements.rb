class CreateProjectRequirements < ActiveRecord::Migration[5.0]
  def change
    create_table :project_requirements do |t|

      t.timestamps
    end
  end
end
