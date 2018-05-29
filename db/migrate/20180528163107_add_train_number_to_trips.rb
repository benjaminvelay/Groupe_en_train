class AddTrainNumberToTrips < ActiveRecord::Migration[5.2]
  def change
    add_column :trips, :train_number, :string
  end
end
