class Profession < ApplicationRecord
  ALCHEMY = "Alchemist"
  ARTISAN = "Artisan"
  RITUALIST = "Ritualist"
  SCHOLAR = %w(Geologist Herbalist Zoologist)
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

  def self.artisan
    find_by(name: ARTISAN)
  end

  def self.ritualist
    find_by(name: RITUALIST)
  end

  def self.scholar
    where(name: SCHOLAR)
  end
end
