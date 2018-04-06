class BankAccount < ApplicationRecord
  belongs_to :character
  has_many :bank_transactions

  def self.has_account?(character_id)
    account = BankAccount.where('character_id = ?', character_id)
    if account.length > 0
      return true
    end
  end
end
