class RemoveAlchemistFromCharacters < ActiveRecord::Migration[5.0]
  class Character < ApplicationRecord
    has_many :character_professions
    has_many :professions, through: :character_professions

    def profession_alchemist?
      professions.include?(Profession.alchemy)
    end
  end

  class Profession < ApplicationRecord
    ALCHEMY = "Alchemy"

    def self.alchemy
      find_by(name: ALCHEMY)
    end
  end

  class CharacterProfession < ApplicationRecord
    belongs_to :character
    belongs_to :profession
  end

  def up
    Character.all.each { |character| character.update(professions: [Profession.alchemy]) if character.alchemist? }
    remove_column :characters, :alchemist
  end

  def down
    add_column :characters, :alchemist, :boolean, default: false
    Character.all.each { |character| character.update(alchemist: true) if character.profession_alchemist? }
  end
end
