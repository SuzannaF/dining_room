class Menu < ApplicationRecord
  has_many :dishes
  has_many :chefs, through: :events
  belongs_to :event
end
