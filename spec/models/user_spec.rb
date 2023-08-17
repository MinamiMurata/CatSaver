require "rails_helper"

RSpec.describe User, type: :model do
  # 全てが有効な状態であること
  it "is valid with a name, introduction, image, email, password, role, is_deleted" do
    user1 = User.new(name: "ユーザー", introduction: "こんにちは！", email: "user1@test.com", password: "password", role: 0, is_deleted: false)
    user1.image = Rack::Test::UploadedFile.new(File.join(Rails.root, "spec/fixtures/images/test.jpg"))
    user1.valid?
    expect(user1).to be_valid
  end
  # 名前がなければ無効な状態であること
  it "is invalid without a name" do
    user2 = User.new(introduction: "こんにちは！", email: "user2@test.com", password: "password", role: 0, is_deleted: false)
    user2.valid?
    expect(user2).not_to be_valid
  end
  # メールアドレスがなければ無効な状態であること
  it "is invalid without a email" do
    user3 = User.new(name: "ユーザー", introduction: "こんにちは！", password: "password", role: 0, is_deleted: false)
    user3.valid?
    expect(user3).not_to be_valid
  end
  # 重複したメールアドレスの場合、無効な状態であること
  it "is invalid duplicate email address" do
    FactoryBot.create(:user, email: "test@test.com")
    user4 = User.new(name: "ユーザー", introduction: "こんにちは！", email: "test@test.com", password: "password", role: 0, is_deleted: false)
    user4.valid?
    expect(user4).not_to be_valid
  end
  # パスワードがなければ無効な状態であること do
  it "is invalid without a password" do
    user5 = User.new(name: "ユーザー", introduction: "こんにちは！", email: "user5@test.com", role: 0, is_deleted: false)
    user5.valid?
    expect(user5).not_to be_valid
  end
end
