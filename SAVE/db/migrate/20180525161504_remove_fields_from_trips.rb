class RemoveFieldsFromTrips < ActiveRecord::Migration[5.2]
  def change
    remove_column :trips, :individual_price
    remove_column :trips, :group_price_per_user_cents
  end
end
