class Trip < ApplicationRecord
  has_many :bookings, dependant: :destroy
  has_many :reviews, through: :bookings
end
