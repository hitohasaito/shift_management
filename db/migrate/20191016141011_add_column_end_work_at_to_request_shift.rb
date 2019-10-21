class AddColumnEndWorkAtToRequestShift < ActiveRecord::Migration[5.2]
  def change
    add_column :request_shifts, :end_work_at, :time
  end
end
