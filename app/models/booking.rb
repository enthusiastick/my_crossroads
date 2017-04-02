class Booking < ApplicationRecord
  belongs_to :character, optional: true
  belongs_to :event
  belongs_to :receipt, optional: true
  belongs_to :user
end
