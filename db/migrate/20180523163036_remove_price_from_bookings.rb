class RemovePriceFromBookings < ActiveRecord::Migration[5.2]
  def change
    remove_column :bookings, :booking_price_cents, :string
  end
end
