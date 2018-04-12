class EntityCharacter < ApplicationRecord
  belongs_to :character
  belongs_to :entity

  validates :character, uniqueness: {scope: :entity}
end
