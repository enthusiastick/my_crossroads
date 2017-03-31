class AddAlchemistToCharacters < ActiveRecord::Migration[5.0]
  def change
    add_column :characters, :alchemist, :boolean, default: false
  end
end
