class CreateBowlingInnings < ActiveRecord::Migration[5.2]
  def change
    create_table :bowling_innings do |t|
      t.belongs_to :Innings, index: true, foreign_key: true, null: false
      t.belongs_to :Player, foreign_key: true, null: false
      t.float :overs, null:false, default: 0.0
      t.integer :maidens, null:false, default: 0
      t.integer :runs, null:false, default: 0
      t.integer :wickets, null:false, default: 0
      t.integer :no_balls, null:false, default: 0
      t.integer :wides, null:false, default: 0

      t.timestamps
    end
  end
end
