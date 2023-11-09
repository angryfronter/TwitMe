# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: 'resetpass@twitme.com'
  layout 'mailer'
end
