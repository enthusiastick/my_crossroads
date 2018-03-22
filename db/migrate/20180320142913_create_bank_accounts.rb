class CreateBankAccounts < ActiveRecord::Migration[5.1]
  def change
    create_table :bank_accounts do |t|
      t.belongs_to :character
      t.integer :balance, null:false, default:0
      t.string :transaction_type, null:false
      t.integer :transaction_amount, null:false

      t.timestamps
    end
  end
end
