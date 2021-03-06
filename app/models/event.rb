class Event < ApplicationRecord

  before_validation :generate_slug

  has_many :bookings
  has_many :characters, through: :bookings
  has_many :receipts, through: :bookings
  has_many :users, through: :bookings

  validates_inclusion_of :visible, in: [true, false]
  validates_presence_of :name, :start_date, :end_date
  validates_uniqueness_of :slug
  validate :end_after_start

  def date
    "#{start_date.strftime("%B %-d")} to #{end_date.strftime("%B %-d, %Y")}"
  end

  def end_after_start
    errors.add(:end_date, "can't be before start date") if end_date.present? && end_date < start_date
  end

  def generate_slug
    self.slug ||= name.parameterize
  end

  def price
    if (start_date.beginning_of_day - 5.days).past?
      90
    else
      75
    end
  end

  def regenerate_slug!
    update(slug: name.parameterize)
  end

  def to_param
    slug
  end
end
