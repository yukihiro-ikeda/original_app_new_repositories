class ChangeColumnToComment < ActiveRecord::Migration[6.1]
  def up
    change_column :comments, :content, :text, null: false
  end

  def down
    change_column :comments, :content, :text
  end
end
