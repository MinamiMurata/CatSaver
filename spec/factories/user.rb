FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    email { Faker::Internet.email }
    password { "password" }
    role { 0 }
  end
  factory :admin_user, class: User do
    name { "管理者ユーザーです" }
    email { "admintest@test.com" }
    password { "password" }
    role { 1 }
  end
  factory :second_user, class: User do
    name { Faker::Name.name }
    email { Faker::Internet.email }
    password { "password" }
    role { 0 }
  end
end
