FactoryBot.define do
  factory :user do
    id { 1 }
    name { Faker::Name.name }
    email { Faker::Internet.email }
    password { "password" }
  end
end
