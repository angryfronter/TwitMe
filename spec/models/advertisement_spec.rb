require 'rails_helper'

RSpec.describe Advertisement, type: :model do
  let(:user) { create(:user) }

  it 'is valid with valid attributes' do
    advertisement = build(:advertisement, user: user)
    expect(advertisement).to be_valid
  end

  it 'is not valid without a title' do
    advertisement = build(:advertisement, title: nil, user: user)
    expect(advertisement).not_to be_valid
  end

  it 'is not valid without a body' do
    advertisement = build(:advertisement, body: nil, user: user)
    expect(advertisement).not_to be_valid
  end

  it 'is not valid with a short title' do
    advertisement = build(:advertisement, title: 'Test', user: user)
    expect(advertisement).not_to be_valid
  end

  it 'is not valid with a short body' do
    advertisement = build(:advertisement, body: 'Test', user: user)
    expect(advertisement).not_to be_valid
  end

  it 'is not valid without a user' do
    advertisement = build(:advertisement, user: nil)
    expect(advertisement).not_to be_valid
  end
end
