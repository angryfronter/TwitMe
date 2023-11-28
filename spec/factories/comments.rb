FactoryBot.define do
  factory :comment do
    body { 'Test comment' }
    user
    association :advertisement
  end
end
