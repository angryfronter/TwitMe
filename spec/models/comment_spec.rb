require 'rails_helper'

RSpec.describe Comment, type: :model do
  it 'is valid with valid attributes' do
    advertisement = Advertisement.create(title: 'Test Advertisement', body: 'Test Body')
    user = User.create(email: 'test@example.com', password: 'password', full_name: 'Test User')
    comment = Comment.new(body: 'Test Comment', user: user, advertisement: advertisement)
    expect(comment).to be_valid
  end

  it 'is not valid without a body' do
    comment = Comment.new(body: nil)
    expect(comment).not_to be_valid
  end

end
