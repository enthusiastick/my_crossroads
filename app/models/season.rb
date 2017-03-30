class Season < ApplicationRecord
  MONTHS = {
    Ers: "January",
    Carris: "February",
    Tyir: "March",
    Rennse: "April",
    Fyrunn: "May",
    Medrim: "June",
    Arridun: "July",
    Grenn: "August",
    Ottur: "September",
    Curnnos: "October",
    Surrn: "November",
    Errund: "December"
  }
  FALL = ["Ottur", "Curnnos", "Surrn"]
  SPRING = ["Tyir", "Rennse", "Fyrunn"]
  SUMMER = ["Medrim", "Arridun", "Grenn"]
  WINTER = ["Errund", "Ers", "Carris"]

  has_many :ingredient_seasons
  has_many :ingredients, through: :ingredient_seasons

  validates_uniqueness_of :name

  def self.months
    where(name: MONTHS.keys)
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

  def self.qvellsvart
    find_by(name: "Qvellsvart")
  end

  def self.varcindium
    find_by(name: "Varcindium")
  end
end
