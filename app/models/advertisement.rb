class Advertisement < ApplicationRecord
  validates :title, presence: true, length: {minimum: 5}
  validates :body, presence: true, length: {minimum: 20}
end
