class CreateTeams < ActiveRecord::Migration[5.2]
  def change
    create_table :teams do |t|
      t.string :name
      t.integer :won
      t.integer :drawn
      t.integer :lost
      t.integer :noresult

      t.timestamps
    end
  end
end
