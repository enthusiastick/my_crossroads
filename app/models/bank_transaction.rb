class BankTransaction < ApplicationRecord
belongs_to :bank_account

def self.calculate_balance(account, transaction)
  new_balance = 0
  if transaction.transaction_type == "Debit"
    new_balance = account.balance - transaction.transaction_amount
    account.update(balance:new_balance)
  else
    new_balance = account.balance + transaction.transaction_amount
    account.update(balance:new_balance)
  end
end
end
