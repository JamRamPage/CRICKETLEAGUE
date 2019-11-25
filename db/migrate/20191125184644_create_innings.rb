class CreateInnings < ActiveRecord::Migration[5.2]
  def change
    create_table :innings do |t|
      t.belongs_to :match, index: true, foreign_key: true
      t.boolean :hometeambatted, null: false
      t.integer :byes, null: false
      t.integer :legbyes, null: false
      t.integer :penalties, null: false

      t.timestamps
    end
  end
end
