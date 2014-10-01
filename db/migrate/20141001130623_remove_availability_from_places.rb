class RemoveAvailabilityFromPlaces < ActiveRecord::Migration
  def change
    remove_column :places, :availability, :string
  end
end
