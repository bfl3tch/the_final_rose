class Event < ApplicationRecord
  belongs_to :outing
  belongs_to :contestant
end
