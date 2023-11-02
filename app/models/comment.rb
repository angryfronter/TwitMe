# frozen_string_literal: true

class Comment < ApplicationRecord
  belongs_to :advertisement
  belongs_to :user

  validates :body, presence: true, length: { minimum: 2 }
end
