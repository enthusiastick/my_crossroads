class Profession < ApplicationRecord
  has_many :ingredient_professions
  has_many :ingredients, through: :ingredient_professions

  validates_presence_of :name
end
