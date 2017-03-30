class CreateIngredients < ActiveRecord::Migration[5.0]
  def change
    create_table :ingredients do |t|
      t.string :name, null: false
      t.text :staff_notes
      t.integer :grade
      t.integer :category, null: false, default: 0
      t.integer :rarity, null: false, default: 0
      t.string :process_calcination
      t.string :process_concentration
      t.string :process_dissolution
      t.string :process_extraction
      t.boolean :archived, default: false

      t.timestamps
    end
  end
end
