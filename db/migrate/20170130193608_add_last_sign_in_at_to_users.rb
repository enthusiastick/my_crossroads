class AddLastSignInAtToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :last_signed_in_at, :datetime
  end
end
