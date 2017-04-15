class AddCraftingAndRitualToIngredients < ActiveRecord::Migration[5.0]
  def change
    add_column :ingredients, :crafting, :string
    add_column :ingredients, :ritual, :string
  end
end
