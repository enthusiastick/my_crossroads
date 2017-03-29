class Profession < ApplicationRecord
  has_many :ingredient_professions
  has_many :ingredients, through: :ingredient_professions

  validates_uniqueness_of :name
end
