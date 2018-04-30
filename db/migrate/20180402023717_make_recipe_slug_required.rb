class MakeRecipeSlugRequired < ActiveRecord::Migration[5.1]
  def up
    change_column :recipes, :slug, :string, null:false
  end

  def down
    change_column :recipes, :slug, :string
  end
end
