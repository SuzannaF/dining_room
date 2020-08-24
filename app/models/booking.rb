class Booking < ApplicationRecord
  has_many :reviews
  belongs_to :user
  belongs_to :event
  vaidates :number_people, presence: true, inclusion: { in: w%(1..2), message: "Maximum two persons per booking" }
end
