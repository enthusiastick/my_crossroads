class CreateEntityCharacters < ActiveRecord::Migration[5.1]
  def change
    create_table :entity_characters do |t|
      t.belongs_to :entity
      t.belongs_to :character
    end
    add_index :entity_characters, [:entity_id, :character_id], unique: true
  end
end
