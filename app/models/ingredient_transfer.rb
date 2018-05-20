class IngredientTransfer < ApplicationRecord
belongs_to :source_inventory, class_name: 'Inventory', foreign_key: :source_inventory_id
belongs_to :target_inventory, class_name: 'Inventory', foreign_key: :target_inventory_id
belongs_to :ingredient, class_name: 'Ingredient', foreign_key: :ingredient_id

has_many :inventories

end
