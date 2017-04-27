class CreateStaffProfiles < ActiveRecord::Migration[5.0]
  def change
    create_table :staff_profiles do |t|
      t.text :blurb
      t.text :contact
      t.string :picture
      t.boolean :published, default: false, null: false
      t.text :responsibilities
      t.integer :series, default: 10, null: false
      t.string :title, null: false
      t.integer :user_id, null: false

      t.timestamps
    end
    add_index :staff_profiles, :user_id, unique: true
  end
end
