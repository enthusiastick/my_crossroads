class AddCraftingAndRitualToInventories < ActiveRecord::Migration[5.0]
  def change
    add_column :inventories, :unlocked_crafting, :boolean, default: false
    add_column :inventories, :unlocked_ritual, :boolean, default: false
  end
end
