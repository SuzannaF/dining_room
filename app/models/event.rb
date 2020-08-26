class Event < ApplicationRecord
  has_many :bookings
  has_one :menu
  has_one_attached :photo
  has_many :dishes, through: :menus
  belongs_to :chef
  belongs_to :user
  validates :address, :price, :capacity, :date, :description, presence: true
end
