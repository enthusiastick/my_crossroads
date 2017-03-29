class Season < ApplicationRecord
  has_many :ingredient_seasons
  has_many :ingredients, through: :ingredient_seasons

  validates_uniqueness_of :name
end
