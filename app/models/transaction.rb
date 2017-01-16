class Transaction < ApplicationRecord
  belongs_to :contributor, class_name: :Character
  belongs_to :recipient, class_name: :Character
  belongs_to :user

  validates_presence_of :description, :user
end
