class RemoveUserIdFromShifts < ActiveRecord::Migration[5.2]
  def change
    remove_foreign_key :shifts, :users
    remove_reference :shifts, :user, index: true
  end
end
