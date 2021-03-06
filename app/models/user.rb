class User < ApplicationRecord
  before_save { self.email = email.downcase }
  validates :name, presence: true, length: { maximum: 50 }, uniqueness: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i.freeze
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  has_many :events, foreign_key: 'creator_id'
  has_many :attendances
  has_many :attended_events, through: :attendances, source: :event
  before_validation :record_signup, on: :create

  def authenticated?(remember_token)
    self.remember_token == remember_token
  end

  private

  def record_signup
    token = SecureRandom.urlsafe_base64
    crypt_token = Digest::SHA1.hexdigest token.to_s
    self.remember_token = crypt_token
  end
end
