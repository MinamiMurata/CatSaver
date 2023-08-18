FactoryBot.define do
  factory :cat do
    name { "ねこ" }
    introduction { "よろしくにゃ" }
    birthday { "2022-02-22" }
    user
    breed
  end
  factory :second_cat, class: Cat do
    name { "レオ" }
    introduction { "よろしくにゃ" }
    birthday { "2022-02-22" }
    user
    breed
  end
end
