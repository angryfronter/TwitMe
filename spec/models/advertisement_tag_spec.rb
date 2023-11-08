require 'rails_helper'

RSpec.describe AdvertisementTag, type: :model do
  it 'is valid with valid attributes' do
    advertisement = create(:advertisement)
    tag = create(:tag)
    advertisement_tag = AdvertisementTag.new(advertisement: advertisement, tag: tag)
    expect(advertisement_tag).to be_valid
  end

  it 'is not valid without an advertisement' do
    tag = create(:tag)
    advertisement_tag = AdvertisementTag.new(advertisement: nil, tag: tag)
    expect(advertisement_tag).not_to be_valid
  end

  it 'is not valid without a tag' do
    advertisement = create(:advertisement)
    advertisement_tag = AdvertisementTag.new(advertisement: advertisement, tag: nil)
    expect(advertisement_tag).not_to be_valid
  end
end
