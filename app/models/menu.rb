class Menu < ApplicationRecord
  has_many :dishes
  belongs_to :event
  belongs_to :chef
end
