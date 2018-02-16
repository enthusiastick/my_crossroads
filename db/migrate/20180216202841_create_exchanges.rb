class CreateExchanges < ActiveRecord::Migration[5.1]
  def change
    create_table :exchanges do |t|
      t.integer :sender_id, null: false
      t.integer :recipient_id, null: false

      t.datetime :accepted_at

      t.timestamps
    end

    create_table :exchange_ingredients do |t|
      t.integer :exchange_id, null: false
      t.integer :ingredient_id, null: false
      t.integer :quantity, default: 1

      t.timestamps
    end
    add_index :exchange_ingredients, [:exchange_id, :ingredient_id], unique: true
  end
end
