class AddSlugToRecipes < ActiveRecord::Migration[5.1]
  def up
    add_column :recipes, :slug, :string
    add_index :recipes, :slug, unique:true
  end
  def down
    remove_index :recipes, :slug
    remove_column :recipes, :slug
  end
end
