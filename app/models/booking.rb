class Booking < ApplicationRecord
  belongs_to :character, optional: true
  belongs_to :event
  belongs_to :receipt
  belongs_to :user

  def paid?
    receipt.amount > 0
  end
end
