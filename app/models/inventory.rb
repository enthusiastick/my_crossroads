class Inventory < ApplicationRecord
  belongs_to :character
  belongs_to :ingredient

  scope :order_by_ingredient_name, -> { includes(:ingredient).order("ingredients.name") }

  validates_inclusion_of :unlocked_calcination, :unlocked_concentration, :unlocked_dissolution, :unlocked_extraction, :unlocked_crafting, :unlocked_ritual, in: [true, false]
  validates_numericality_of :quantity, greater_than_or_equal_to: 0, only_integer: true
  validates_presence_of :character, :ingredient, :quantity
  validates_uniqueness_of :ingredient, scope: :character
end
