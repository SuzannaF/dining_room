class Review < ApplicationRecord
  belongs_to :booking
  validates :rating, :comment, presence: true
  validates :comment, length: { minimum: 20 }
  validates :rating, inclusion: { in: (1..5), message: "%{rating} should be a number between 1 and 5" }
end
