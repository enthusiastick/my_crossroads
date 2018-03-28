class Recipe < ApplicationRecord
  PROCESSES = ["Extraction", "Calcination","Dissolution", "Concentration"]
  CATEGORIES = [
    "Coatings",
    "Gasses",
    "Inert",
    "Inks",
    "Liniments",
    "Particulates",
    "Sprays",
    "Tonics",
    "Vials"
  ]
  SUBTYPES =[
    "Dust",
    "Elixir",
    "Gas",
    "Grease",
    "Inert",
    "Ink",
    "Oil",
    "Ointment",
    "Potion",
    "Powder",
    "Salve",
    "Tincture",
    "Vial"
  ]

  has_many :ingredient_1, class_name: "Ingredient", foreign_key: :ingredient_1_id
  has_many :ingredient_2, class_name: "Ingredient", foreign_key: :ingredient_2_id
  has_many :ingredient_3, class_name: "Ingredient", foreign_key: :ingredient_3_id
  has_many :ingredient_4, class_name: "Ingredient", foreign_key: :ingredient_4_id
  has_many :recipe_books
  has_many :characters, through: :recipe_books


def self.processes
   Recipe::PROCESSES
end

def self.categories
  Recipe::CATEGORIES
end

def self.subtypes
  Recipe::SUBTYPES
end

end
