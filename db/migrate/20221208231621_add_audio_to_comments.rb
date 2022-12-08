class AddAudioToComments < ActiveRecord::Migration[6.1]
  def change
    add_column :comments, :audio, :string
  end
end
