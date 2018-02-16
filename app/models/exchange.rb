class Exchange < ApplicationRecord
  belongs_to :sender, class_name: :Character
  belongs_to :recipient, class_name: :Character

  def accepted?
    !accepted_at.nil?
  end
end
