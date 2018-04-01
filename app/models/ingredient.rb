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

  mount_uploader :picture, PictureUploader

  has_many :ingredient_professions, dependent: :destroy
  has_many :professions, through: :ingredient_professions
  accepts_nested_attributes_for :professions
  has_many :ingredient_seasons, dependent: :destroy
  has_many :seasons, through: :ingredient_seasons
  accepts_nested_attributes_for :seasons
  has_many :inventories, dependent: :destroy
  has_many :characters, through: :inventories
  has_many :recipes

  validates_presence_of :category, :name, :rarity

  scope :by_name, -> { order(:name) }

  def ritual_properties
    ritual_properties = Array.new
    ritual_properties << "Attribute: #{ritual_attribute}" if !ritual_attribute.blank?
    ritual_properties << "Elemental Affinity: #{ritual_elemental_affinity}" if !ritual_elemental_affinity.blank?
    ritual_properties << "Gender: #{ritual_gender}" if !ritual_gender.blank?
    ritual_properties
  end

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
