class AddTeamRefToAssigns < ActiveRecord::Migration[6.1]
  def change
    add_reference :assigns, :team, null: false, foreign_key: true
  end
end
