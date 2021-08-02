class Bachelorette <ApplicationRecord
  has_many :contestants

  def average_age
    contestants.average(:age).round(2)
  end

  def hometown_list
    #select an individual bachelorette
    #get all the contestants
    # list all their hometowns
    contestants.pluck("contestants.hometown").uniq
  end

end
