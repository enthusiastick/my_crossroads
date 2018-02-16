class ExchangeIngredient < ApplicationRecord
  belongs_to :exchange
  belongs_to :ingredient
end
