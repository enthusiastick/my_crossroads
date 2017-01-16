class Inventory < ApplicationRecord
  belongs_to :character
  belongs_to :ingredient

  validates_presence_of :character, :ingredient, :quantity, :primary, :secondary, :tertiary
  validates_numericality_of :quantity, greater_than_or_equal_to: 0, only_integer: true
end
