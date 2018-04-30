class Character < ApplicationRecord

  before_validation :generate_slug
  before_validation :strip_name

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
  has_many :inventories
  has_many :ingredients, through: :inventories
  accepts_nested_attributes_for :inventories
  has_one :bank_account
  has_one :recipe_book
  has_many :character_recipes
  has_many :recipes, through: :character_recipes

  validates_numericality_of :drake, allow_nil: true, only_integer: true, greater_than_or_equal_to: 0
  validates_presence_of :name, :slug, :user
  validates_uniqueness_of :name, :slug

  scope :by_name, -> { order(:name) }

  def alchemist?
    professions.include?(Profession.alchemy)
  end

  def artisan?
    professions.include?(Profession.artisan)
  end

  def ritualist?
    professions.include?(Profession.ritualist)
  end

  def scholar?
    professions.any? { |profession| Profession.scholar.include?(profession) }
  end

  def to_param
    slug
  end

  protected

  def generate_slug
    self.slug ||= name.parameterize
  end

  def strip_name
    self.name = self.name.strip
  end
end
