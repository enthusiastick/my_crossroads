class Receipt < ApplicationRecord
  attr_accessor :card, :character_id, :city, :phone, :report, :state, :street, :zip

  belongs_to :user

  has_many :bookings
  has_many :characters, through: :bookings
  has_many :events, through: :bookings

  validates_numericality_of :amount, greater_than_or_equal_to: 0
  validates_presence_of :ip_address

  def self.new_from_charge(charge)
    new(
      amount: charge.amount / 100.0,
      stripe_id: charge.id,
      brand: charge.source.brand,
      expiry: "#{charge.source.exp_month}/#{charge.source.exp_year}",
      last_4: charge.source.last4
    )
  end

  def send_confirmation_email
    ReceiptMailer.registration_confirmation(self.id).deliver_now
  end

  def send_directors_email
    ReceiptMailer.registration_directors(self.id).deliver_now
  end
end
