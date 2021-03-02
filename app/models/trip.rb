class Trip < ApplicationRecord
  has_many :bookings, dependent: :destroy
  has_many :reviews, through: :bookings
  has_many :favorites
  has_one_attached :photo
end
