class StaffProfile < ApplicationRecord
  belongs_to :user

  mount_uploader :picture, PictureUploader

  validates_inclusion_of :published, in: [true, false]
  validates_numericality_of :series, only_integer: true
  validates_presence_of :title
  validate :user_is_staff

  def user_is_staff
    unless user.staff?
      errors.add(:user, "must be staff")
    end
  end
end
