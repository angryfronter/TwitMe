# frozen_string_literal: true

class User < ApplicationRecord
  include Recoverable
  enum role: { basic: 0, moderator: 1, admin: 2 }, _suffix: :role

  attr_accessor :old_password, :admin_edit

  has_secure_password validations: false

  has_many :advertisements, dependent: :destroy
  has_many :comments, dependent: :destroy

  validate :password_presence
  validate :correct_old_password, on: :update, if: -> { password.present? && !admin_edit }
  validates :password, confirmation: true, allow_blank: true, length: { minimum: 4, maximum: 8 }

  validates :email, presence: true, uniqueness: true, 'valid_email_2/email': true
  validates :role, presence: true

  def guest?
    false
  end

  def author?(obj)
    obj.user == self
  end

  private

  def correct_old_password
    return if BCrypt::Password.new(password_digest_was).is_password?(old_password)

    errors.add :old_password, 'Is incorrect'
  end

  def password_presence
    errors.add(:password, :blank) if password_digest.blank?
  end
end
