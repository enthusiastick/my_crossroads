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
      t.integer :user_id

      t.timestamps
    end
    add_index :bookings, [:character_id, :user_id], unique: true
  end
end
