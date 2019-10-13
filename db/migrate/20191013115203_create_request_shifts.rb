class CreateRequestShifts < ActiveRecord::Migration[5.2]
  def change
    create_table :request_shifts do |t|
      t.date :worked_on
      t.time :worked_at
      t.string :work_job

      t.timestamps
    end
  end
end
