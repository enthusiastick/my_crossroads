class Profession < ApplicationRecord
  ALCHEMY = "Alchemy"
  CRAFTING = "Craftsman"
  RITUALIST = "Ritualist"
  STOCK = %w(Alchemy Apothecary Astrology Craftsman Herbalist/Mycologist Husbandry Merchant Miner/Geologist Ritualist Physician)

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
