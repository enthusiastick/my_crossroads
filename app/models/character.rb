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

  has_many :ingredients, through: :inventories
  has_many :contributions, class_name: :Transaction, foreign_key: :contributor_id
  has_many :inventories
  accepts_nested_attributes_for :inventories
  has_many :transactions, foreign_key: :recipient_id

  validates_inclusion_of :alchemist, in: [true, false]
  validates_presence_of :name, :slug, :user
  validates_uniqueness_of :name, :slug

  def to_param
    slug
  end

  protected

  def generate_slug
    self.slug ||= name.parameterize
  end
end
