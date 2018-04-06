class AddTargetAccountToBankAcounts < ActiveRecord::Migration[5.1]
  def up
    add_reference :bank_transactions, :target_account, index: true
  end
  def down
    remove_column :bank_transactions, :target_account_id
  end
end
