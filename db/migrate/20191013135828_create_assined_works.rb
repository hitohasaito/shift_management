class CreateAssinedWorks < ActiveRecord::Migration[5.2]
  def change
    create_table :assined_works do |t|
      t.references :user, foreign_key: true
      t.references :shift, foreign_key: true

      t.timestamps
    end
  end
end
