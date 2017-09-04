class AddRitualsToIngredients < ActiveRecord::Migration[5.1]
  def up
    remove_column :ingredients, :ritual
    add_column :ingredients, :ritual_attribute, :string
    add_column :ingredients, :ritual_elemental_affinity, :string
    add_column :ingredients, :ritual_gender, :string
    add_column :ingredients, :ritual_opposite, :string
  end
  def down
    add_column :ingredients, :ritual, :string
    remove_column :ingredients, :ritual_attribute
    remove_column :ingredients, :ritual_elemental_affinity
    remove_column :ingredients, :ritual_gender
    remove_column :ingredients, :ritual_opposite
  end
end
