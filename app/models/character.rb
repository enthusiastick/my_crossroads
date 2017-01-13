class Character < ApplicationRecord
  before_validation :generate_slug
  belongs_to :user
  validates_presence_of :name, :slug, :user

  def to_param
    slug
  end

  protected

  def generate_slug
    self.slug ||= name.parameterize
  end
end
