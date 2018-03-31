class CreateRecipeIngredientTable < ActiveRecord::Migration[5.1]
  def change
    create_table :recipe_ingredients do |t|
      t.belongs_to :recipe
      t.references :extraction_ingredient
      t.references :dissolution_ingredient
      t.references :concentration_ingredient
      t.references :calcination_ingredient
    end
  end
end
