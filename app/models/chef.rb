class Chef < ApplicationRecord
  has_many :events
  has_one :menu, through: :events
  validates :name, :image, :description, presence: true
end
