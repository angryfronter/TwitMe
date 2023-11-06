module Recoverable
  extend ActiveSupport::Concern

  included do
    require 'digest'

    def set_password_reset_token
      update password_reset_token: Digest::SHA256.hexdigest(SecureRandom.urlsafe_base64),
             password_reset_token_sent_at: Time.current
    end
  end
end