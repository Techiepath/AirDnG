class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.integer :place_id
      t.integer :guest_id
      t.string :status

      t.timestamps
    end
  end
end
