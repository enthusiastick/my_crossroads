class CreateLedgers < ActiveRecord::Migration[5.1]
  def change
    create_table :ledgers do |t|
      t.text :description
      t.integer :heading, null: false
      t.integer :recipient_id, null: false
      t.integer :sender_id, null: false
      t.integer :user_id, null: false

      t.timestamps
    end
  end
end
