class Ledger < ApplicationRecord
  belongs_to :recipient, class_name: :Character
  belongs_to :sender, class_name: :Character
  belongs_to :user
end
