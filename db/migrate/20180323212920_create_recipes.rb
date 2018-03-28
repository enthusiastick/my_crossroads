class CreateRecipes < ActiveRecord::Migration[5.1]
  def change
    create_table :recipes do |t|
      t.string :name, null:false
      t.string :subtype, null:false
      t.string :category, null:false
      t.integer :level, null:false
      t.string :effect_family, null:false
      t.string :delivery, null:false
      t.string :application_time
      t.string :duration
      t.string :effect, null:false
      t.text :description, null:false
      t.references :ingredient_1, reference: :ingredients ,null:false
      t.references :ingredient_2, reference: :ingredients
      t.references :ingredient_3, reference: :ingredients
      t.references :ingredient_4, reference: :ingredients
      t.string :process_1, null:false
      t.string :process_2
      t.string :process_3
      t.string :process_4
      t.string :hex_code

      t.timestamps
    end
    add_index :recipes, :name, unique: true
  end
end
