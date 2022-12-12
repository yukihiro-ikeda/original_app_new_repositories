class AddPublicToComments < ActiveRecord::Migration[6.1]
  def change
    add_column :comments, :public, :integer
  end
end
