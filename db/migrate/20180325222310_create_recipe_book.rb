class CreateRecipeBook < ActiveRecord::Migration[5.1]
  def change
    create_table :recipe_books do |t|
      t.belongs_to :character
      t.references :recipes

      t.timestamps
    end
  end
end
