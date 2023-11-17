FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    full_name { Faker::Name.name }
    password { 'password' }
    password_confirmation { 'password' }
    birthday { Date.new(1990, 1, 1) }
    address { 'Some Address' }
    city { 'Some City' }
    state { 'Some State' }
    country { 'Some Country' }
    zip { '12345' }

    trait :admin_role do
      after(:create) { |user| user.update_attribute(:role, 'admin') }
    end

    trait :moderator_role do
      after(:create) { |user| user.update_attribute(:role, 'moderator') }
    end

    trait :author_role do
      after(:create) { |user| user.update_attribute(:role, 'author') }
    end
  end
end
