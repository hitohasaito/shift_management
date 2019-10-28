class AddNotNulltoRequestShiftTable < ActiveRecord::Migration[5.2]
  def up
    change_column :request_shifts, :end_work_at, :time, null: false
    change_column :request_shifts, :user_id, :integer, null: false
  end

  def down
    change_column :request_shifts, :end_work_at, :time, null: true
    change_column :request_shifts, :user_id, :integer, null: false
  end
end
