FactoryBot.define do
  factory :breed do
    id { 1 }
    name { Faker::Creature::Cat.breed }
  end
end
