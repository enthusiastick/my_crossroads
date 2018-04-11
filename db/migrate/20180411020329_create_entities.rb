class CreateEntities < ActiveRecord::Migration[5.1]
  def change
    create_table :entities do |t|
      t.string :name, null:false
      t.text :description, null:false
      t.string :slug, null:false
    end
    add_index :entities, :name, unique: true
    add_index :entities, :slug, unique: true
  end
end
