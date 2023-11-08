class User < ApplicationRecord
  attr_accessor :old_password

  has_secure_password validations: false

  validate :password_presence
  validate :correct_old_password, on: :update, if: -> {password.present? }
  validates :password, confirmation: true, allow_blank: true, length: {minimum: 4, maximum: 8}


  validates :email, presence: true, uniqueness: true, 'valid_email_2/email': true

  private

  def correct_old_password
    return if BCrypt::Password.new(password_digest_was).is_password?(old_password)

    errors.add :old_password, 'Is incorrect'
  end

  def password_presence
    errors.add(:password, :blank) unless password_digest.present?
  end
end