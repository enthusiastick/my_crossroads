class Receipt < ApplicationRecord
  attr_accessor :card, :character_id, :city, :phone, :report, :state, :street, :zip

  has_many :bookings
  has_many :characters, through: :bookings
  has_many :events, through: :bookings
  has_many :users, through: :bookings

  validates_numericality_of :amount, greater_than_or_equal_to: 0
  validates_presence_of :ip_address, name
end
