class Actor < ApplicationRecord
  
  def self.average_age
    average(:age)
  end
end