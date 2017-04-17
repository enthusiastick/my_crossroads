class CreateCharacterProfessions < ActiveRecord::Migration[5.0]
  def change
    create_table :profession_links do |t|
      t.string :name, null: false
      t.integer :profession_id, null: false
      t.text :url, null: false

      t.timestamps
    end
    create_table :character_professions do |t|
      t.integer :character_id, null: false
      t.integer :profession_id, null: false

      t.timestamps
    end
    add_index :character_professions, [:character_id, :profession_id], unique: true
    create_table :character_profession_links do |t|
      t.integer :character_id, null: false
      t.integer :link_id, null: false

      t.timestamps
    end
    add_index :character_profession_links, [:character_id, :link_id], unique: true
  end
end
