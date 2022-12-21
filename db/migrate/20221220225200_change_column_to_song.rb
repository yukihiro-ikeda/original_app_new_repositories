class ChangeColumnToSong < ActiveRecord::Migration[6.1]
  def up
    change_column :songs, :title, :string, null: false
  end

  def down
    change_column :songs, :title, :string
  end
end
