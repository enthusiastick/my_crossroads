class AddLastSignInAtToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :failed_sign_in_attempts, :integer, { default: 0 }
    add_column :users, :last_signed_in_at, :datetime
    add_column :users, :sign_in_count, :integer, { default: 0 }
  end
end
