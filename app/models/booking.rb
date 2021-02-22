class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :trip
  belongs_to :chatroom
  has_many :reviews, dependant: :destroy
end
