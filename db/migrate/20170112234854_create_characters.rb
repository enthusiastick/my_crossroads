class CreateCharacters < ActiveRecord::Migration[5.0]
  def change
    create_table :characters do |t|
      t.string :name, null: false
      t.text :history, default: ""
      t.string :slug, null: false
      t.belongs_to :user, null: false

      t.timestamps
    end
  end
end
