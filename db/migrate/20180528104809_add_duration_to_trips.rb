class AddDurationToTrips < ActiveRecord::Migration[5.2]
  def change
    add_column :trips, :duration, :string
  end
end
