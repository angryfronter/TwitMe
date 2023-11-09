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
  end
end
