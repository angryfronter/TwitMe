require 'rails_helper'

RSpec.describe Tag, type: :model do
  it 'is valid with valid attributes' do
    tag = Tag.new(title: 'Test Tag')
    expect(tag).to be_valid
  end

  it 'is not valid without a title' do
    tag = Tag.new(title: nil)
    expect(tag).not_to be_valid
  end

  it 'is not valid with a non-unique title' do
    Tag.create(title: 'Test Tag')
    tag = Tag.new(title: 'Test Tag')
    expect(tag).not_to be_valid
  end

end
