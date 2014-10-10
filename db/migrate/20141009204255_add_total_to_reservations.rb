class AddTotalToReservations < ActiveRecord::Migration
  def change
    add_column :reservations, :total, :integer
  end
end
