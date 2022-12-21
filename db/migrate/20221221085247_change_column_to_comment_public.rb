class ChangeColumnToCommentPublic < ActiveRecord::Migration[6.1]
  def up
    change_column :comments, :publiccomment, :boolean, default: false
  end

  def down
    change_column :comments, :publiccomment, :boolean
  end
end
