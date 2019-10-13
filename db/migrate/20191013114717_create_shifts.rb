class CreateShifts < ActiveRecord::Migration[5.2]
  def change
    create_table :shifts do |t|
      t.date :duty_on
      t.time :duty_at
      t.string :job
      t.string :assigned_user

      t.timestamps
    end
  end
end
