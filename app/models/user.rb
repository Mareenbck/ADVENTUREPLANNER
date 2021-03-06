class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :bookings
  has_many :chatrooms, through: :bookings
  has_many :reviews, dependent: :destroy
  has_many :trips, through: :bookings
  has_many :favorites, dependent: :destroy
  has_many :favorite_trips, through: :favorites, source: :trip
  has_one_attached :photo
  has_many :messages

  def find_chatroom(chat)
    bookings.find_by(chatroom_id: chat.id)
  end
  
end
