require "rails_helper"

RSpec.describe Cat, type: :model do
  let!(:user) { FactoryBot.create(:user) }
  let!(:breed) { FactoryBot.create(:breed) }
  # 全てが有効な状態であること
  it "is valid with a name, introduction, image, birthday, breed_id, user_id" do
    cat1 = Cat.new(name: "ねこ", introduction: "よろしくにゃ", birthday: "2022-02-22", breed_id: breed.id, user_id: user.id)
    cat1.image = Rack::Test::UploadedFile.new(File.join(Rails.root, "spec/fixtures/images/test.jpg"))
    cat1.valid?
    expect(cat1).to be_valid
  end
  # 名前がなければ無効な状態であること
  it "is invalid without a name" do
    cat2 = Cat.new(introduction: "よろしくにゃ", birthday: "2022-02-22", breed_id: breed.id, user_id: user.id)
    cat2.valid?
    expect(cat2).not_to be_valid
  end
  # breed_idがなければ無効な状態であること
  it "is invalid without a breed_id" do
    cat3 = Cat.new(name: "ねこ", introduction: "よろしくにゃ", birthday: "2022-02-22", user_id: user.id)
    cat3.valid?
    expect(cat3).not_to be_valid
  end
  # ユーザーidがなければ無効な状態であること
  it "is invalid without a user_id" do
    cat4 = Cat.new(name: "ねこ", introduction: "よろしくにゃ", birthday: "2022-02-22", breed_id: breed.id)
    cat4.valid?
    expect(cat4).not_to be_valid
  end
end
