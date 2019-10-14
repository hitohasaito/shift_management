class AddUserRefToRequestShift < ActiveRecord::Migration[5.2]
  def change
    add_reference :request_shifts, :user, foreign_key: true
  end
end
