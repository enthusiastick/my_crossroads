class CreateStacks < ActiveRecord::Migration[5.1]
  def change
    create_table :stacks do |t|
      t.datetime :accepted_at
      t.integer :event_id
      t.datetime :printed_at
      t.integer :receiving_character_id
      t.integer :sending_character_id, null: false

      t.timestamps
    end
    create_table :stack_ingredients do |t|
      t.integer :ingredient_id, null: false
      t.integer :quantity, default: 1
      t.integer :stack_id, null: false

      t.timestamps
    end
    add_index :stack_ingredients, [:ingredient_id, :stack_id], unique: true
  end
end
