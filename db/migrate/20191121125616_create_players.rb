class CreatePlayers < ActiveRecord::Migration[5.2]
  def change
    create_table :players do |t|
      t.string :name, null: false
      t.date :DOB, null: false
      t.belongs_to :team, index: true, foreign_key: true, null: false
      # Initial definitions of enums (declared as integers here,
      # and completed in Players.rb model file):
      t.integer :role, null: false
      t.integer :battinghand, null: false
      t.integer :bowlingstyle, null: false
      t.string :domesticteam

      t.timestamps
    end
  end
end
