class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.string :address
      t.text :directions
      t.datetime :end_date, null: false
      t.float :latitude
      t.float :longitude
      t.string :name, null: false
      t.string :slug, null: false
      t.datetime :start_date, null: false
      t.boolean :visible, default: true

      t.timestamps
    end
    add_index :events, :slug, unique: true
    create_table :bookings do |t|
      t.integer :character_id
      t.integer :event_id, null: false
      t.integer :receipt_id
      t.integer :user_id, null: false

      t.timestamps
    end
    add_index :bookings, [:event_id, :user_id], unique: true
    create_table :receipts do |t|
      t.decimal :amount, { precision: 8, scale: 2 }
      t.string :brand
      t.string :expiry
      t.string :ip_address, null: false
      t.string :last_4
      t.string :name, null: false
      t.string :stripe_token
      t.string :stripe_id

      t.timestamps
    end
  end
end
