class CreateFocusAreas < ActiveRecord::Migration[5.0]
  def change
    create_table :focus_areas do |t|

      t.timestamps
    end
  end
end
