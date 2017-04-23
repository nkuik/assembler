class CreateMemberSkills < ActiveRecord::Migration[5.0]
  def change
    create_table :member_skills do |t|
      t.references :team_member
      t.integer :years_experience
      t.string :education_type
      t.text :skills, array: true, default: []
      t.text :skill_categories, array: true, default: []
      t.text :techs, array: true, default: []
      t.text :tech_categories, array: true, default: []
      t.text :characteristics, array: true, default: []

      t.timestamps
    end
  end
end
