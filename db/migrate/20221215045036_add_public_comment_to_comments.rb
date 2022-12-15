class AddPublicCommentToComments < ActiveRecord::Migration[6.1]
  def change
    add_column :comments, :publiccomment, :boolean
  end
end
