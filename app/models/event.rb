class Event < ApplicationRecord
  has_many :bookings
  has_one :menu
  belongs_to :chef
  belongs_to :user
end
