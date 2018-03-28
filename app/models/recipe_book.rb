class RecipeBook < ApplicationRecord
  belongs_to :character
  has_many :recipes
  has_many :ingredients, through: :recipes

end
