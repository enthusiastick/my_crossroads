class CreateEntityStores < ActiveRecord::Migration[5.1]
  def change
    create_table :entity_stores do |t|
      t.belongs_to :entity
      t.references :storable, polymorphic: true
      t.integer :quantity
    end
    add_index :entity_stores, [:entity_id, :storable_id, :storable_type], unique:true, name:"store_item"
  end
end
