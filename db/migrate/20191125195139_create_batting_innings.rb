class CreateBattingInnings < ActiveRecord::Migration[5.2]
  def change
    create_table :batting_innings do |t|
      t.belongs_to :Innings, index: true, foreign_key: true, null: false
      t.belongs_to :Player, foreign_key: true, null: false
      t.integer :runs, null: false, default: 0
      t.integer :balls, null: false, default: 0
      t.integer :fours, null: false, default: 0
      t.integer :sixes, null: false, default: 0
      t.integer :howout, null: false, default: 0
      t.belongs_to :bowler, class_name: 'Player'
      t.belongs_to :fielder, class_name: 'Player'

      t.timestamps
    end
  end
end
