class CharacterProfessionLink < ApplicationRecord
  belongs_to :character
  belongs_to :link, class_name: :ProfessionLink
end
