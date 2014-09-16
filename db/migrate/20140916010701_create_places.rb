class CreatePlaces < ActiveRecord::Migration
  def change
    create_table :places do |t|
      t.string :address
      t.integer :price
      t.text :description
      t.string :availability
      t.string :kind
      t.string :state
      t.integer :owner_id

      t.timestamps
    end
  end
end
