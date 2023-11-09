# frozen_string_literal: true

class AdvertisementPolicy < ApplicationPolicy
  def create?
    !user.guest?
  end

  def update?
    user.admin_role? || user.moderator_role? || user.author?(record)
  end

  def destroy?
    user.admin_role? || user.moderator_role?
  end

  def index?
    true
  end

  def show?
    true
  end
end
