class Inventory < ApplicationRecord
  belongs_to :character
  belongs_to :ingredient

  validates_inclusion_of :primary, :secondary, :tertiary, in: [true, false]
  validates_numericality_of :quantity, greater_than_or_equal_to: 0, only_integer: true
  validates_presence_of :character, :ingredient, :quantity
  validates_uniqueness_of :ingredient, scope: :character
end
