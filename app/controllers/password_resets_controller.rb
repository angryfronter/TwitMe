class PasswordResetsController < ApplicationController
  before_action :require_no_authentication

  def create
    PasswordResetMailer.with(user: @user).reset_email.deliver_later
  end
end