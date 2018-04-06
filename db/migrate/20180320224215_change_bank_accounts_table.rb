class ChangeBankAccountsTable < ActiveRecord::Migration[5.1]
  def up
    remove_column :bank_accounts, :transaction_type
    remove_column :bank_accounts, :transaction_amount
  end
  def down
    add_column :bank_accounts, :transaction_type, :string, null: false
    add_column :bank_accounts, :transaction_amount, :integer, null:false
  end
end
