FactoryBot.define do
  factory :tag do
    sequence(:title) { |n| "Test tag #{n}"}
  end
end
