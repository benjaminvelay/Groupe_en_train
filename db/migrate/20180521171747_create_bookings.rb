class CreateBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :bookings do |t|
      t.references :trip_id, foreign_key: true
      t.references :user_id, foreign_key: true
      t.integer :status

      t.timestamps
    end
  end
end
