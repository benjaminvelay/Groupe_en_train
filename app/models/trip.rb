class Trip < ApplicationRecord
  has_many :bookings
  has_many :users, through: :bookings
  monetize :group_price_per_user_cents
end
