class CreateCharacteristics < ActiveRecord::Migration[5.0]
  def change
    create_table :characteristics do |t|
      t.text :options, array: true, default: ["serious",
                                              "quirky",
                                              "professional",
                                              "enterprise",
                                              "avant-garde",
                                              "esoteric",
                                              "boring",
                                              "bleeding edge",
                                              "another buzzword"
                                             ]

      t.timestamps
    end
  end
end
