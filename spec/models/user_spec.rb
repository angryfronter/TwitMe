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
end
