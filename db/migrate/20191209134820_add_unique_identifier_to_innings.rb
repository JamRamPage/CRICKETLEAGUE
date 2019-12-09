class AddUniqueIdentifierToInnings < ActiveRecord::Migration[5.2]
  def change
    remove_index "Innings", name: "index_innings_on_match_id"
    add_index :Innings, [:match, :hometeambatted], unique: true
  end
end
