class Menu < ApplicationRecord
  has_one_attached :photo
  has_many :dishes
  belongs_to :event
end
