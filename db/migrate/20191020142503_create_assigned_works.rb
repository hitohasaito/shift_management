class CreateAssignedWorks < ActiveRecord::Migration[5.2]
  def change
    create_table :assigned_works do |t|
      t.references :user, foreign_key: true, null:false
      t.references :shift, foreign_key: true, null: false

      t.timestamps
    end
  end
end
