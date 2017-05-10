class Profession < ApplicationRecord
  ALCHEMY = "Alchemist"
  CRAFTING = "Artisan"
  RITUALIST = "Ritualist"
  STOCK = %w(Alchemist Apothecary Artisan Astrologer Geologist Herbalist Merchant Physician Ritualist Zoologist)

  has_many :character_professions
  has_many :characters, through: :character_professions
  has_many :ingredient_professions
  has_many :ingredients, through: :ingredient_professions
  has_many :profession_links

  validates_uniqueness_of :name

  def self.alchemy
    find_by(name: ALCHEMY)
  end

  def self.crafting
    find_by(name: CRAFTING)
  end

  def self.ritualist
    find_by(name: RITUALIST)
  end
end
