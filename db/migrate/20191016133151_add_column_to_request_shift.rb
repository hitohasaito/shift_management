class AddColumnToRequestShift < ActiveRecord::Migration[5.2]
  def change
    add_column :shifts, :end_work_at, :time
  end
end
