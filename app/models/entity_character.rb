class EntityCharacter < ApplicationRecord
  belongs_to :character
  belongs_to :entity
end
