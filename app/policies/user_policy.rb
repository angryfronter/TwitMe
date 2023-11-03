# frozen_string_literal: true

class UserPolicy < ApplicationPolicy
  def create?
    user.guest?
  end

  def update?
    record == user
  end

  # for list of users
  def index?
    false
  end

  def show?
    true
  end

  def destroy?
    false
  end
end
