class StackIngredient < ApplicationRecord
  belongs_to :ingredient
  belongs_to :stack

  validates_numericality_of :quantity, greater_than: 0, only_integer: true
end
