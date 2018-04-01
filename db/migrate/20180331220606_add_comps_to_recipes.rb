class AddCompsToRecipes < ActiveRecord::Migration[5.1]
  def up
    add_reference :recipes, :extraction_ingredient, index: true
    add_reference :recipes, :calcination_ingredient, index: true
    add_reference :recipes, :dissolution_ingredient, index: true
    add_reference :recipes, :concentration_ingredient, index: true

    drop_table :recipe_ingredients
  end

  def down
    remove_column :recipes, :extraction_ingredient_id
    remove_column :recipes, :calcination_ingredient_id
    remove_column :recipes, :dissolution_ingredient_id
    remove_column :recipes, :concentration_ingredient_id

    create_table :recipe_ingredients do |t|
      t.belongs_to :recipe
      t.references :extraction_ingredient
      t.references :dissolution_ingredient
      t.references :concentration_ingredient
      t.references :calcination_ingredient
    end
  end
end
