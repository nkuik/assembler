class CreateMemberSkills < ActiveRecord::Migration[5.0]
  def change
    create_table :member_skills do |t|

      t.timestamps
    end
  end
end
