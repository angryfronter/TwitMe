# frozen_string_literal: true

class Advertisement < ApplicationRecord
  include Authorship

  has_many :comments, dependent: :destroy
  belongs_to :user

  has_many :advertisement_tags, dependent: :destroy
  has_many :tags, through: :advertisement_tags

  validates :title, presence: true, length: { minimum: 5 }
  validates :body, presence: true, length: { minimum: 5 }

  scope :all_by_tags, lambda { |tag_ids, page, per_page|
    advertisements = includes(:user, :advertisement_tags, :tags)
    advertisements = advertisements.joins(:tags).where(tags: tag_ids) if tag_ids
    advertisements.order(created_at: :desc).page(page).per(per_page)
  }
end
