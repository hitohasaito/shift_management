class RemoveEndWorkAtFromShift < ActiveRecord::Migration[5.2]
  def change
    remove_column :shifts, :end_work_at
  end
end
