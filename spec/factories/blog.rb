FactoryBot.define do
  factory :blog do
    title { "テスト体験記のタイトル" }
    content { "テスト体験記の本文" }
    disease_name { "テスト体験記の病名" }
    age_range { 1 }
    user
    cat
  end
end
