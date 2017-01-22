class IngredientProfession < ApplicationRecord
  belongs_to :ingredient
  belongs_to :profession

  validates_presence_of :ingredient, :profession
  validates_uniqueness_of :ingredient, scope: :profession
end
