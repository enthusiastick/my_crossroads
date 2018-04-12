class RemoveBankableType < ActiveRecord::Migration[5.1]
  def change
    add_column :bank_accounts, :bankable_type, :string
    remove_column :bank_accounts, :bankable_type
  end
end
