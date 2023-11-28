# frozen_string_literal: true

class CommentDecorator < ApplicationDecorator
  delegate_all
  decorates_association :user

  def formatted_created_at
    created_at.strftime('%d-%m-%Y %H:%M:%S')
  end
end
