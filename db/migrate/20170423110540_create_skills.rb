class CreateSkills < ActiveRecord::Migration[5.0]
  def change
    create_table :skills do |t|
      t.references :team_member
      t.integer :years_experience
      t.string :education
      t.string :education_type
      t.string :skill_category
      t.text :skills, array: true, default: []
      t.text :techs, array: true, default: []
      t.text :tech_categories, array: true, default: []
      t.text :characteristics, array: true, default: []

      t.timestamps
    end
  end
end
