class Ingredient < ApplicationRecord
  enum category: {
    special: 0,
    animal: 1,
    essence: 2,
    gem: 3,
    insect: 4,
    mechanical: 5,
    mineral: 6,
    metal: 7,
    mushroom: 8,
    plant: 9,
    stone: 10,
    vial: 11
  }

  enum rarity: {
    common: 0,
    uncommon: 1,
    scarce: 2,
    rare: 3,
    extra_rare: 4
  }

  has_many :ingredient_professions
  has_many :professions, through: :ingredient_professions
  accepts_nested_attributes_for :professions
  has_many :ingredient_seasons
  has_many :seasons, through: :ingredient_seasons
  accepts_nested_attributes_for :seasons
  has_many :inventories
  has_many :characters, through: :inventories

  validates_presence_of :category, :name, :rarity

  def season
    case seasons.order(:id)
    when Season.months
      "Any"
    when Season.fall
      "Fall"
    when Season.spring
      "Spring"
    when Season.summer
      "Summer"
    when Season.winter
      "Winter"
    when Season.spring + Season.summer
      "Spring/Summer"
    when Season.spring + Season.fall
      "Spring/Fall"
    when [Season.qvellsvart]
      "Qvellsvart"
    when [Season.varcindium]
      "Varcindium"
    else
      "Varied"
    end
  end
end
