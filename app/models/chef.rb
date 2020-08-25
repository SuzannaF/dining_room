class Chef < ApplicationRecord
  has_many :events
  validates :name, :image, :description, presence: true
end
