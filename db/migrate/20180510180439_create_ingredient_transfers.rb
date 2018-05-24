class CreateIngredientTransfers < ActiveRecord::Migration[5.1]
  def change
    create_table :ingredient_transfers do |t|
      t.references :source_inventory, null:false
      t.references :ingredient, null:false
      t.references :target_inventory, null:false
      t.integer :quantity,null:false

      t.timestamps
    end
  end
end
