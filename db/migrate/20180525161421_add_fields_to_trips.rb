class AddFieldsToTrips < ActiveRecord::Migration[5.2]
  def change
    add_column :trips, :individual_sncf_price_cents, :integer
    add_column :trips, :individual_group_price_cents, :integer
  end
end
