class AddBankerToUsers < ActiveRecord::Migration[5.1]
  def up
    add_column :users, :banker, :boolean, default: false
  end
  def down
    remove_column :users, :banker
  end
end
