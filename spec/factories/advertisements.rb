FactoryBot.define do
  factory :advertisement do
    title { 'Test Advertisement' }
    body { 'This is a test advertisement.' }
    association :user, factory: :user
  end
end
