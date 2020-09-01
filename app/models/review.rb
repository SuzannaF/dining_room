class Review < ApplicationRecord
  belongs_to :booking
  validates :rating, :comment, :rating_host, presence: true
  # removed comment validation 20 caracters are too much.
  # validates :comment, length: { minimum: 20 }
  validates :rating, :rating_host, inclusion: { in: (1..5), message: "%{rating} should be a number between 1 and 5" }
end
