class Player < ApplicationRecord
  belongs_to :team

  def self.average_age
    average(:age)
  end
end
