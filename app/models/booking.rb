class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :review
  belongs_to :trip
  belongs_to :chatroom
end
