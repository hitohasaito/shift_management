class RemoveAssinedWork < ActiveRecord::Migration[5.2]
  def change
    drop_table :assined_works
  end
end
