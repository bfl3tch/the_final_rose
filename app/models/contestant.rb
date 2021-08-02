class Contestant <ApplicationRecord
  belongs_to :bachelorette
  has_many :events
  has_many :outings, through: :events

end
