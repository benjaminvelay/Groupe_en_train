class AddStripeToBookings < ActiveRecord::Migration[5.2]
  def change
    add_column :bookings, :state, :string
    add_column :bookings, :payment, :jsonb
  end
end
