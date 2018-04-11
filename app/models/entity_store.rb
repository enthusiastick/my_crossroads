class EntityStore < ApplicationRecord
  belongs_to :entity
  belongs_to :storable, polymorphic: true
end
