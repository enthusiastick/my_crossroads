class ChangeTransaction < ActiveRecord::Migration[5.1]
  def up
    rename_table :transactions_tables, :bank_transactions
  end

  def down
    rename_table :bank_transactions, :transactions_tables
  end
end
