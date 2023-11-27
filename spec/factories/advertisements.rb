FactoryBot.define do
  factory :advertisement do
    title { 'Test Advertisement' }
    body { Faker::Lorem.paragraphs(number: 5).join("\n\n") }
    association :user, factory: :user
  end
end
