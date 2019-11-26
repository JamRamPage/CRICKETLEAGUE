class AddBattingOrderToBattingInnings < ActiveRecord::Migration[5.2]
  def change
    add_column :batting_innings, :batsman_number, :integer, null: false, default: 1
  end
end
