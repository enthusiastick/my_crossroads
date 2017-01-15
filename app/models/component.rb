class Component < ApplicationRecord
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

  validates_presence_of :category, :name, :rarity
end
