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
    user.present?
  end

  def all_users?
    user.present?
  end

  def show?
    true
  end

  def destroy?
    false
  end

  def initialize(user, record)
    @user = user || GuestUser.new
    @record = record
  end
end
