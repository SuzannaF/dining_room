class Booking < ApplicationRecord
  has_one :review, dependent: :destroy
  belongs_to :user
  belongs_to :event
  validates :number_people, presence: true, inclusion: { in: (1..2), message: "Maximum two persons per booking" }
end
