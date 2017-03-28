class CreateInventories < ActiveRecord::Migration[5.0]
  def change
    create_table :inventories do |t|
      t.belongs_to :character, null: false
      t.belongs_to :ingredient, null: false
      t.integer :quantity, default: 0
      t.boolean :unlocked_calcination, default: false
      t.boolean :unlocked_concentration, default: false
      t.boolean :unlocked_dissolution, default: false
      t.boolean :unlocked_extraction, default: false

      t.timestamps
    end
    add_index :inventories, [:character_id, :ingredient_id], unique: true
  end
end
