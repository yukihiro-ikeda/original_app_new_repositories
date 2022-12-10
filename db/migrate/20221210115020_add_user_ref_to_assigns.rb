class AddUserRefToAssigns < ActiveRecord::Migration[6.1]
  def change
    add_reference :assigns, :user, null: false, foreign_key: true
  end
end
