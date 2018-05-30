class CreateTrips < ActiveRecord::Migration[5.2]
  def change
    create_table :trips do |t|
      t.datetime :departure_at
      t.datetime :arrival_at
      t.float :individual_price
      t.float :group_price_per_user_cents
      t.string :station_departure
      t.string :station_arrival

      t.timestamps
    end
  end
end
