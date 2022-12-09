class AddSongRefToComments < ActiveRecord::Migration[6.1]
  def change
    add_reference :comments, :song, null: false, foreign_key: true
  end
end
