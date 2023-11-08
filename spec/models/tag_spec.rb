require 'rails_helper'

RSpec.describe Tag, type: :model do
  it 'is valid with valid attributes' do
    tag = create(:tag)
    expect(tag).to be_valid
  end

  it 'is not valid without a title' do
    tag = build(:tag, title: nil)
    expect(tag).not_to be_valid
  end

  it 'is not valid with a non-unique title' do
    create(:tag, title: 'Test Tag')
    tag = build(:tag, title: 'Test Tag')
    expect(tag).not_to be_valid
  end
end
