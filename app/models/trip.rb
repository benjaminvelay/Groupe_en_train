class Trip < ApplicationRecord
  has_many :users
  monetize :group_price_per_user_cents
end
