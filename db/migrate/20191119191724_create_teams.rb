class CreateTeams < ActiveRecord::Migration[5.2]
  def change
    create_table :teams do |t|
      t.string :name, null: false
      t.integer :won, null: false, default: 0
      t.integer :drawn, null: false, default: 0
      t.integer :lost, null: false, default: 0
      t.integer :noresult, null: false, default: 0

      t.timestamps
    end
  end
end
