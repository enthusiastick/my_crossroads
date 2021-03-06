class CreateCharacters < ActiveRecord::Migration[5.0]
  def change
    create_table :characters do |t|
      t.string :name, null: false
      t.text :history, default: ""
      t.integer :race, default: 0
      t.string :slug, null: false
      t.belongs_to :user, null: false

      t.boolean :archived, default: false
      t.timestamps
    end
    add_index :characters, :slug, unique: true
  end
end
