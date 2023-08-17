require "rails_helper"

RSpec.describe Cat, type: :model do
  let(:user) { FactoryBot.create(:user) }
  let!(:breed) { FactoryBot.create(:breed) }
  # 全てが有効な状態であること
  it "is valid with a name, introduction, birthday, breed_id, user_id" do
    cat = Cat.new(name: "ねこ", introduction: "よろしくにゃ", birthday: "2022-02-22", breed_id: breed.id, user_id: user.id)
    cat.image = Rack::Test::UploadedFile.new(File.join(Rails.root, "spec/fixtures/images/test.jpg"))
    expect(cat).to be_valid
  end
  # # 名前がなければ無効な状態であること
  # it "is invalid without a name"
  # # breed_idがなければ無効な状態であること
  # it "is invalid without a breed_id"
  # # ユーザーidがなければ無効な状態であること
  # it "is invalid without a user_id"
end
