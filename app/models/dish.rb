class Dish < ApplicationRecord
  belongs_to :menu
  has_many :events, through: :menus
  validates :name, :description, :image, presence: true
end
