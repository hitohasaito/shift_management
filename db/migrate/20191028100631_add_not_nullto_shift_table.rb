class AddNotNulltoShiftTable < ActiveRecord::Migration[5.2]
  def up
    change_column :shifts, :end_at, :time, null: false
  end

  def down
    change_column :shifts, :end_at, :time, null: true
  end
end
