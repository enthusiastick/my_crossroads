class CharacterSerializer < ActiveModel::Serializer
  attributes :id, :name, :race
  has_many :non_zero_inventories
end
