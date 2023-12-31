require 'rails_helper'

RSpec.describe User, type: :model do
  it 'is valid with valid attributes' do
    user = build(:user,
                 email: 'test@example.com',
                 full_name: 'John Doe',
                 password: 'password',
                 password_confirmation: 'password',
                 birthday: '1990-01-01',
                 address: 'Some Address',
                 city: 'Some City',
                 state: 'Some State',
                 country: 'Some Country',
                 zip: '12345')
    expect(user).to be_valid
  end

  it 'is not valid without an email' do
    user = build(:user, email: nil)
    expect(user).not_to be_valid
  end

  it 'is not valid with a duplicate email' do
    create(:user, email: 'test@example.com')
    user = build(:user, email: 'test@example.com')
    expect(user).not_to be_valid
  end

  it 'returns true for author? if the user is the author' do
    advertisement = create(:advertisement)
    user = advertisement.user
    expect(user.author?(advertisement)).to be true
  end

  it 'returns false for author? if the user is not the author' do
    user = create(:user)
    advertisement = create(:advertisement)
    expect(user.author?(advertisement)).to be false
  end
end
