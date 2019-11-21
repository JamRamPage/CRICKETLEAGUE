class CreateMatches < ActiveRecord::Migration[5.2]
  def change
    create_table :matches do |t|
      t.date :date, null: false
      t.belongs_to :hometeam, index: true, null: false, class_name: 'Team'
      t.belongs_to :awayteam, index: true, null: false, class_name: 'Team'
      t.string :stadium, null: false

      t.timestamps
    end
  end
end
