class Entity < ApplicationRecord
  has_many :entity_characters
  has_many :characters, through: :entity_characters
  has_many :entity_stores
  has_many :ingredients, through: :entity_stores
  has_one :bank_account
end
