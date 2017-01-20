class CreateSeasons < ActiveRecord::Migration[5.0]
  def change
    create_table :seasons do |t|
      t.string :name, null: false
      t.string :equivalent

      t.timestamp
    end
    create_table :ingredient_seasons do |t|
      t.belongs_to :ingredient
      t.belongs_to :season

      t.timestamps
    end
    add_index :ingredient_seasons, [:ingredient_id, :season_id], unique: true
  end
end
