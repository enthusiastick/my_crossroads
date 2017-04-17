class Character < ApplicationRecord

  before_validation :generate_slug

  belongs_to :user

  enum race: {
    other: 0,
    dagon: 1,
    elf: 2,
    haroc: 3,
    human: 4,
    krosan: 5,
    mystic: 6,
    ritika: 7,
    undead_ghoul: 8,
    undead_lyche: 9,
    undead_vampyre: 10,
    wyldling: 11
  }

  has_many :bookings
  has_many :character_professions
  has_many :professions, through: :character_professions
  has_many :character_profession_links
  has_many :profession_links, through: :character_profession_links, source: :link
  has_many :events, through: :bookings
  has_many :ingredients, through: :inventories
  has_many :inventories
  accepts_nested_attributes_for :inventories

  validates_numericality_of :drake, allow_nil: true, only_integer: true, greater_than_or_equal_to: 0
  validates_presence_of :name, :slug, :user
  validates_uniqueness_of :name, :slug

  scope :by_name, -> { order(:name) }

  def alchemist?
    professions.include?(Profession.alchemy)
  end

  def to_param
    slug
  end

  protected

  def generate_slug
    self.slug ||= name.parameterize
  end
end
