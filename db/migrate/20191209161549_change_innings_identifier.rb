class ChangeInningsIdentifier < ActiveRecord::Migration[5.2]
  def self.up
    remove_index :Innings, name: "index_Innings_on_match_and_hometeambatted"
    add_index :Innings, [:match_id, :hometeambatted], unique: true
  end

  def self.down
    remove_index :Innings, name: "index_Innings_on_match_and_hometeambatted"
    add_index :Innings, [:match_id, :hometeambatted]
  end
end
