# frozen_string_literal: true

class AdvertisementTag < ApplicationRecord
  belongs_to :advertisement
  belongs_to :tag
end
