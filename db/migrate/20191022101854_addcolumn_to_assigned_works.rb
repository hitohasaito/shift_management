class AddcolumnToAssignedWorks < ActiveRecord::Migration[5.2]
  def change
    add_column :assigned_works, :assigned_time, :integer
  end
end
