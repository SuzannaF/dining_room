class Chef < ApplicationRecord
  has_many :events
  has_one_attached :photo
  validates :name, :description, presence: true
end
