class ChangeColumnToTeam < ActiveRecord::Migration[6.1]
  def up
    change_column :teams, :name, :string, null: false
  end

  def down
    change_column :teams, :name, :string
  end
end
