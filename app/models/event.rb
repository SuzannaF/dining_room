class Event < ApplicationRecord
  has_many :bookings
  has_many :dishes, through: :menus
  has_one :menu
  belongs_to :chef
  belongs_to :user
  validates :address, :price, :capacity, :date, presence: true
end
