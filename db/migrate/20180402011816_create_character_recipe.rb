class CreateCharacterRecipe < ActiveRecord::Migration[5.1]
  def up
    create_table :character_recipes do |t|
      t.belongs_to :character
      t.belongs_to :recipe
      t.references :recipe_book
    end
    remove_column :recipe_books, :recipes_id
    add_reference :recipe_books, :character_recipes
  end

  def down
    add_reference :recipe_books, :recipes
    remove_column :recipe_books, :character_recipes_id
    drop_table :character_recipes

  end

end
