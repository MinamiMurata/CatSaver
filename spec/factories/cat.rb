FactoryBot.define do
  factory :cat do
    name { "ねこ" }
    introduction { "よろしくにゃ" }
    birthday { "2022-02-22" }
    user
    breed
  end
end
