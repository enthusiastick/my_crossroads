class CreateProfessions < ActiveRecord::Migration[5.0]
  def change
    create_table :professions do |t|
      t.string :name, null: false

      t.timestamps
    end
    create_table :ingredient_professions do |t|
      t.belongs_to :ingredient
      t.belongs_to :profession

      t.timestamps
    end
    add_index :ingredient_professions, [:ingredient_id, :profession_id], unique: true
  end
end
