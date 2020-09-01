class Event < ApplicationRecord
  # Added dependent destroy to bookings, so that if an event is
  # 'deleted' by 'host' the bookings are also deleted
  # In the real world, we would probably include a message of warning
  # to the atendees
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  has_many :bookings, dependent: :destroy
  has_one :menu
  has_one_attached :photo
  has_many :dishes, through: :menus
  belongs_to :chef
  belongs_to :user
  validates :address, :price, :capacity, :date, :description, presence: true
end
