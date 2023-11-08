# Checking the validity of the relationship between Advertisement and Tag

require 'rails_helper'

RSpec.describe AdvertisementTag, type: :model do
  it 'is valid with valid attributes' do
    advertisement = Advertisement.create(title: 'Test Advertisement', body: 'Test Body')
    tag = Tag.create(title: 'Test Tag')
    advertisement_tag = AdvertisementTag.new(advertisement: advertisement, tag: tag)
    expect(advertisement_tag).to be_valid
  end

  it 'is not valid without an advertisement' do
    tag = Tag.create(title: 'Test Tag')
    advertisement_tag = AdvertisementTag.new(advertisement: nil, tag: tag)
    expect(advertisement_tag).not_to be_valid
  end

  it 'is not valid without a tag' do
    advertisement = Advertisement.create(title: 'Test Advertisement', body: 'Test Body')
    advertisement_tag = AdvertisementTag.new(advertisement: advertisement, tag: nil)
    expect(advertisement_tag).not_to be_valid
  end

end
