class UserDecorator < ApplicationDecorator
  delegate_all

  def full_name_or_email
    return full_name if full_name.present?

    email.split("@").first
  end
end
