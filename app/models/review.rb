class Review < ApplicationRecord
  belongs_to :user
  belongs_to :booking

  validates :content, presence: true
  validates :rating, numericality: { greater_than: 0, less_than_or_equal_to: 5 }, presence: true
end
