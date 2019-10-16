class AddColumnToShift < ActiveRecord::Migration[5.2]
  def change
    add_column :shifts, :end_at, :time
  end
end
