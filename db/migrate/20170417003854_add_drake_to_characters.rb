class AddDrakeToCharacters < ActiveRecord::Migration[5.0]
  def change
    add_column :characters, :drake, :integer
  end
end
