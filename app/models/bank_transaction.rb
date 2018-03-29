class BankTransaction < ApplicationRecord
  belongs_to :bank_account
  belongs_to :target_account, class_name: 'BankAccount', foreign_key: :target_account_id, optional:true

  def self.validate_balance?(account, transaction_type, amount)
    if transaction_type =="Debit" || transaction_type == "Transfer"
      if account.balance - amount.to_i <0 
        return true
      end
    end
  end

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

  def self.transfer(from_account, to_account, transaction)
    new_balance_from = 0
    new_balance_to = 0
    new_balance_from = from_account.balance - transaction.to_i
    new_balance_to = to_account.balance + transaction.to_i
    from_account.update(balance:new_balance_from)
    to_account.update(balance: new_balance_to)
  end
end
