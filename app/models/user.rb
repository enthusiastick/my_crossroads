class User < ApplicationRecord
  EMAIL_REGEXP = /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/
  HANDLE_REGEXP = /\A[A-Za-z0-9]+(?:[_-][A-Za-z0-9]+)*\z/

  attr_accessor :confirmation_token, :password_reset_token, :remember_token

  before_create :generate_confirmation_digest
  before_save :downcase_email

  has_many :bookings
  has_many :events, through: :bookings
  has_many :characters
  has_many :transactions
  has_one :staff_profile

  has_secure_password

  validates_format_of :email, with: EMAIL_REGEXP
  validates_format_of :handle, with: HANDLE_REGEXP, message: "may only contain letters, numbers, dashes, and underscores (no spaces or other special characters), and must begin with a letter or number"
  validates_inclusion_of :editor, in: [true, false]
  validates_inclusion_of :staff, in: [true, false]
  validates_length_of :handle, in: 3..30
  validates_presence_of :email, :first_name, :handle, :last_name
  validates_uniqueness_of :email, :handle

  scope :by_name, -> { order(:first_name) }
  scope :confirmed, -> { where.not(confirmed_at: nil) }

  def assign_attributes_from_receipt(hash)
    assign_attributes(
      phone: hash[:phone],
      street_address: hash[:street],
      city: hash[:city],
      state: hash[:state],
      zip: hash[:zip],
      self_report: hash[:report]
    )
  end

  def authenticated?(attribute, token)
    digest = self.send("#{attribute}_digest")
    return false if digest.nil?
    BCrypt::Password.new(digest).is_password?(token)
  end

  def confirm!
    touch(:confirmed_at) if confirmed_at.nil?
  end

  def confirmed?
    !confirmed_at.nil?
  end

  def downcase_email
    self.email.downcase!
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  def generate_remember_digest
    self.remember_token = User.new_token
    update_attributes(remember_digest: User.digest(remember_token))
  end

  def generate_reset_digest
    self.password_reset_token = User.new_token
    update_attributes(password_reset_digest: User.digest(password_reset_token), password_reset_sent_at: Time.current)
  end

  def label
    if staff?
      "#{first_name} #{last_name} (#{handle}*)"
    else
      "#{first_name} #{last_name} (#{handle})"
    end
  end

  def password_reset_expired?
    (password_reset_sent_at + 2.hours).past?
  end

  def send_confirmation_email
    UserMailer.account_confirmation(self.id, self.confirmation_token).deliver_now
  end

  def send_password_reset_email
    UserMailer.password_reset(self.id, self.password_reset_token).deliver_now
  end

  def terminate_remember_digest
    update_attributes(remember_digest: nil)
  end

  def to_param
    handle
  end

  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  def User.new_token
    SecureRandom.urlsafe_base64
  end

  protected

  def generate_confirmation_digest
    self.confirmation_token = User.new_token
    self.confirmation_digest = User.digest(confirmation_token)
  end
end
