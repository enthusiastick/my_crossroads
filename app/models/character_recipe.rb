class CharacterRecipe < ApplicationRecord
belongs_to :character
belongs_to :recipe

validates :recipe, uniqueness: {scope: :character,
  message: "Character already knows this recipe."}

end
