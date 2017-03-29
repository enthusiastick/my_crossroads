class Season < ApplicationRecord
  MONTHS = [
    "Ers",
    "Carris",
    "Tyir",
    "Rennse",
    "Fyrunn",
    "Medrim",
    "Arridun",
    "Grenn",
    "Ottur",
    "Curnnos",
    "Surrn",
    "Errund"
  ]
  FALL = ["Ottur", "Curnnos", "Surrn"]
  SPRING = ["Tyir", "Rennse", "Fyrunn"]
  SUMMER = ["Medrim", "Arridun", "Grenn"]
  WINTER = ["Errund", "Ers", "Carris"]

  has_many :ingredient_seasons
  has_many :ingredients, through: :ingredient_seasons

  validates_uniqueness_of :name

  def self.months
    where(name: MONTHS)
  end

  def self.fall
    where(name: FALL)
  end

  def self.spring
    where(name: SPRING)
  end

  def self.summer
    where(name: SUMMER)
  end

  def self.winter
    where(name: WINTER)
  end

  def self.quellsvart
    find_by(name: "Qvellsvart")
  end

  def self.varcindium
    find_by(name: "Varcindium")
  end
end
