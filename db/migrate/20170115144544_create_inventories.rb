class CreateInventories < ActiveRecord::Migration[5.0]
  def change
    create_table :inventories do |t|
      t.belongs_to :character, null: false
      t.belongs_to :ingredient, null: false
      t.integer :quantity, default: 0
      t.boolean :primary, default: false
      t.boolean :secondary, default: false
      t.boolean :tertiary, default: false

      t.timestamps
    end
  end
end