FactoryBot.define do
  factory :advertisement_tag do
    association :advertisement
    association :tag
  end
end
