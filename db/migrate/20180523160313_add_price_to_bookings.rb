class AddPriceToBookings < ActiveRecord::Migration[5.2]
  def change
    add_column :bookings, :booking_price_cents, :integer
  end
end
