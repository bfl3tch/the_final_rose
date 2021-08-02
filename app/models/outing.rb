class Outing < ApplicationRecord
  has_many :events
  has_many :contestants, through: :events
end
