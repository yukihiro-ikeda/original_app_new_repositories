class CreateAssigns < ActiveRecord::Migration[6.1]
  def change
    create_table :assigns do |t|

      t.timestamps
    end
  end
end
