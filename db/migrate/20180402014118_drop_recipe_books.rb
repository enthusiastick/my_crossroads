class DropRecipeBooks < ActiveRecord::Migration[5.1]
  def up
    remove_column :character_recipes, :recipe_book_id
    drop_table :recipe_books
  end

  def down
    create_table :recipe_books do |t|
      t.belongs_to :character
      t.references :recipes

      t.timestamps
    end
    add_reference :character_recipes, :recipe_books
  end
end
