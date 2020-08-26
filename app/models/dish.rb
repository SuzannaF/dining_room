class Dish < ApplicationRecord
  belongs_to :menu
  has_one_attached :photo
  has_many :events, through: :menus
  validates :name, :description, presence: true
end
