class AddNotNulltoAssignedWorks < ActiveRecord::Migration[5.2]
  def up
    change_column :assigned_works, :assigned_time, :integer, null: false
  end

  def down
    change_column :assigned_works, :assigned_time, :integer, null: false
  end
end
