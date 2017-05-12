class Stack < ApplicationRecord
  belongs_to :event, optional: true
  belongs_to :receiving_character, class_name: :Character
  belongs_to :sending_character, class_name: :Character, optional: true
end
