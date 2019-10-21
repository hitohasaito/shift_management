class RenameColumnOnRequestShift < ActiveRecord::Migration[5.2]
  def change
    rename_column :request_shifts, :worked_at, :start_work_at
  end
end
