# frozen_string_literal: true

class Comment < ApplicationRecord
  include Authorship
  belongs_to :advertisement
  belongs_to :user

  def formatted_created_at
    created_at.strftime('%d-%m-%Y %H:%M:%S')
  end

  def editable_by?(user)
    return false if user.nil? || user.guest?

    user.admin_role? || user.moderator_role? || user.author?(self)
  end

  def destroyable_by?(user)
    return false if user.nil? || user.guest?

    user.admin_role? || user.moderator_role?
  end

  def create_by?(user)
    return false if user.nil? || user.guest?

    user.admin_role? || user.moderator_role? || user.user
  end

  validates :body, presence: true, length: { minimum: 2 }
end
