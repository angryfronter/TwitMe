require 'rails_helper'

RSpec.describe Advertisement, type: :model do
  let(:user) { User.create(email: 'test@example.com', password: 'password') }

  it 'is valid with valid attributes' do
    advertisement = Advertisement.new(
      title: 'Test Advertisement',
      body: 'This is a test advertisement.',
      user: user
    )
    expect(advertisement).to be_valid
  end

  it 'is not valid without a title' do
    advertisement = Advertisement.new(
      title: nil,
      body: 'This is a test advertisement.',
      user: user
    )
    expect(advertisement).not_to be_valid
  end

  it 'is not valid without a body' do
    advertisement = Advertisement.new(
      title: 'Test Advertisement',
      body: nil,
      user: user
    )
    expect(advertisement).not_to be_valid
  end

  it 'is not valid with a short title' do
    advertisement = Advertisement.new(
      title: 'Test',
      body: 'This is a test advertisement.',
      user: user
    )
    expect(advertisement).not_to be_valid
  end

  it 'is not valid with a short body' do
    advertisement = Advertisement.new(
      title: 'Test Advertisement',
      body: 'Test',
      user: user
    )
    expect(advertisement).not_to be_valid
  end

  it 'is not valid without a user' do
    advertisement = Advertisement.new(
      title: 'Test Advertisement',
      body: 'This is a test advertisement.',
      user: nil
    )
    expect(advertisement).not_to be_valid
  end

end
