class Entity < ApplicationRecord
  before_validation :generate_slug

  has_many :entity_characters
  has_many :characters, through: :entity_characters
  has_many :entity_stores
  has_many :ingredients, through: :entity_stores
  has_one :bank_account

  validates_presence_of :name, :slug, :description
  validates_uniqueness_of :name, :slug

  def to_param
    slug
  end
  protected

  def generate_slug
    self.slug ||= name.parameterize
  end
end
