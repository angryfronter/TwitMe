# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include Authorization
  include ErrorHandling
  include Authentication
end
