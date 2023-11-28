# frozen_string_literal: true

class Comment < ApplicationRecord
  include Authorship
  belongs_to :advertisement
  belongs_to :user

  def formatted_created_at
    created_at.strftime('%d-%m-%Y %H:%M:%S')
  end

  validates :body, presence: true, length: { minimum: 2 }
end
