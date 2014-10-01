class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.integer :user_id
      t.integer :place_id
      t.datetime :check_in
      t.datetime :check_out

      t.timestamps
    end
  end
end
