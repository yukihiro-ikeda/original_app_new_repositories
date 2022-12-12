class AddTeamRefToSongs < ActiveRecord::Migration[6.1]
  def change
    add_reference :songs, :team, null: false, foreign_key: true
  end
end
