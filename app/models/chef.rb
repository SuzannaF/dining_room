class Chef < ApplicationRecord
  has_many :events
  has_many :menus, through: :events
  validates :name, :image, :description, presence: true
end
