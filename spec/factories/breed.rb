FactoryBot.define do
  factory :breed do
    name { "アビシニアン" }
  end
  factory :second_breed, class: Breed do
    name { "メインクーン" }
  end
end
