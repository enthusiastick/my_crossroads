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

  has_many :recipe_books
  has_many :characters, through: :recipe_books
  has_many :ingredients, through: :recipe_ingredients
  has_many :recipe_ingredients

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
