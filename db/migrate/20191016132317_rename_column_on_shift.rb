class RenameColumnOnShift < ActiveRecord::Migration[5.2]
  def change
    rename_column :shifts, :duty_at, :started_at 
  end
end
