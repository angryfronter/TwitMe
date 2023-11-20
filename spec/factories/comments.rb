FactoryBot.define do
  factory :comment do
    body { Faker::Lorem.sentence }
    user
    association :advertisement
  end
end
