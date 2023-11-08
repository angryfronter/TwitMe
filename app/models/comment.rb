# frozen_string_literal: true

class Comment < ApplicationRecord
  belongs_to :advertisement

  validates :body, presence: true, length: { minimum: 2 }
end
