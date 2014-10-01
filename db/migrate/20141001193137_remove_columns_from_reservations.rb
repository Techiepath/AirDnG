class RemoveColumnsFromReservations < ActiveRecord::Migration
  def change
    remove_column :reservations, :check_in, :string
    remove_column :reservations, :check_out, :string
  end
end
