class CreateTransactionsTable < ActiveRecord::Migration[5.1]
  def change
    create_table :transactions_tables do |t|
      t.belongs_to :bank_account
      t.string :transaction_type, null:false
      t.integer :transaction_amount, null:false

      t.timestamps
    end
  end
end
