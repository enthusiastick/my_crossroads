class AddIndexToCharacterRecipes < ActiveRecord::Migration[5.1]
  def up
    add_index :character_recipes, [:character_id, :recipe_id], unique:true
  end
  def down
    remove_index :character_recipes, [:character_id, :recipe_id]
  end
end
