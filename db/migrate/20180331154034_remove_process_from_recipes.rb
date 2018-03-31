class RemoveProcessFromRecipes < ActiveRecord::Migration[5.1]
  def up
    remove_column :recipes, :process_1
    remove_column :recipes, :process_2
    remove_column :recipes, :process_3
    remove_column :recipes, :process_4
  end
  def down
    add_column :recipes, :process_1, :string
    add_column :recipes, :process_2, :string
    add_column :recipes, :process_3, :string
    add_column :recipes, :process_4, :string
  end
end
