class RecipeIngredient < ApplicationRecord

belongs_to :recipe
belongs_to :extraction_ingredient, class_name: 'Ingredient', foreign_key: :extraction_ingredient_id, optional: true
belongs_to :concentration_ingredient, class_name: 'Ingredient', foreign_key: :concentration_ingredient_id, optional: true
belongs_to :dissolution_ingredient, class_name: 'Ingredient', foreign_key: :dissolution_ingredient_id, optional: true
belongs_to :calcination_ingredient, class_name: 'Ingredient', foreign_key: :calcination_ingredient_id, optional: true

has_many :ingredients
end
