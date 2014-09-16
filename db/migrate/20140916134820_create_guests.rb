class CreateGuests < ActiveRecord::Migration
  def change
    create_table :guests do |t|
      t.integer :reservation_id
      t.string :name
      t.integer :phone_number
      t.integer :user_id

      t.timestamps
    end
  end
end
