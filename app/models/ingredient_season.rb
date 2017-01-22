class IngredientSeason < ApplicationRecord
  belongs_to :ingredient
  belongs_to :season

  validates_presence_of :ingredient, :season
  validates_uniqueness_of :ingredient, scope: :season
end
