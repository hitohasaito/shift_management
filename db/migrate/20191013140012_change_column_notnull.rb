class ChangeColumnNotnull < ActiveRecord::Migration[5.2]
  def up
    change_column :shifts, :job, :string, null: false

    change_column :comments, :shift_id, :integer, null: false
    change_column :comments, :user_id, :integer, null: false

    change_column :assined_works, :user_id, :integer, null: false
    change_column :assined_works, :shift_id, :integer, null: false
  end

  def down
    change_column :shifts, :job, :string, null: true

    change_column :comments, :shift_id, :integer, null: true
    change_column :comments, :user_id, :integer, null: true

    change_column :assined_works, :user_id, :integer, null: true
    change_column :assined_works, :shift_id, :integer, null: true
  end
end
