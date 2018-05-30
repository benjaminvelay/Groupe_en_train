class Trip < ApplicationRecord
  has_many :bookings
  has_many :users, through: :bookings
  monetize :individual_group_price_cents
  monetize :individual_sncf_price_cents
end
