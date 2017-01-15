class CreateComponents < ActiveRecord::Migration[5.0]
  def change
    create_table :components do |t|
      t.string :name, null: false
      t.string :code
      t.text :staff_notes
      t.integer :level
      t.integer :category, null: false, default: 0
      t.integer :rarity, null: false, default: 0
      t.string :primary
      t.string :secondary
      t.string :tertiary

      t.boolean :archived, default: false
      t.timestamps
    end
  end
end
