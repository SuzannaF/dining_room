class Dish < ApplicationRecord
  belongs_to :menu
  validates :name, :description, :image, presence: true
end
