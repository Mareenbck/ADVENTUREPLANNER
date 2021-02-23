class Trip < ApplicationRecord
  has_many :bookings, dependent: :destroy
  has_many :reviews, through: :bookings
end
