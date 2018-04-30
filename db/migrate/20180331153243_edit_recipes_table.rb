class EditRecipesTable < ActiveRecord::Migration[5.1]
  def up
    remove_column :recipes, :ingredient_1_id
    remove_column :recipes, :ingredient_2_id
    remove_column :recipes, :ingredient_3_id
    remove_column :recipes, :ingredient_4_id
  end

  def down
    add_column :recipes, :ingredient_2_id, :bigint
    add_column :recipes, :ingredient_1_id, :bigint
    add_column :recipes, :ingredient_3_id, :bigint
    add_column :recipes, :ingredient_4_id, :bigint
  end
end
