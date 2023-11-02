class AdvertisementTag < ApplicationRecord
  belongs_to :advertisement
  belongs_to :tag
end
