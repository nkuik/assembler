class CreateMatches < ActiveRecord::Migration[5.0]
  def change
    create_table :matches do |t|
      t.integer :score
      t.references :team_member
      t.references :project

      t.timestamps
    end
  end
end
