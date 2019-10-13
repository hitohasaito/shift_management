class ChangeColumnNull < ActiveRecord::Migration[5.2]
  def up
    change_column :shifts, :duty_on, :date, null: false
    change_column :shifts, :duty_at, :time, null: false
    change_column :shifts, :job, :string, nill: false

    change_column :request_shifts, :worked_on, :date, null: false
    change_column :request_shifts, :worked_at, :time, null: false
    change_column :request_shifts, :work_job, :string, null: false

    change_column :comments, :content, :text, null: false

  end

  def down
    change_column :shifts, :duty_on, :date, null: true
    change_column :shifts, :duty_at, :time, null: true
    change_column :shifts, :job, :string, nill: true

    change_column :request_shifts, :worked_on, :date, null: true
    change_column :request_shifts, :worked_at, :time, null: true
    change_column :request_shifts, :work_job, :string, null: true

    change_column :comments, :content, :text, null: true
  end
end
