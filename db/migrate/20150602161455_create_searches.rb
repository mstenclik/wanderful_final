class CreateSearches < ActiveRecord::Migration
  def change
    create_table :searches do |t|
      t.string :origin
      t.string :destination
      t.integer :duration
      t.string :origin_return
      t.string :destination_return
      t.integer :duration_return
      t.integer :price
      t.string :carrier
      t.string :flight_no
      t.string :carrier_return
      t.string :flight_no_return
      t.string :departure_return_time
      t.string :departure_time

      t.timestamps

    end
  end
end
