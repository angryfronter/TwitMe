class Tag < ApplicationRecord
  has_many :advertisement_tags, dependent: :destroy
  has_many :advertisements, through: :advertisement_tags

  validates :title, presence: true, uniqueness: true
end
