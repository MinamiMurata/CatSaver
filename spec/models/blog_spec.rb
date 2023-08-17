require "rails_helper"

RSpec.describe Blog, type: :model do
  let(:user) { FactoryBot.create(:user) }
  let!(:cat) { FactoryBot.create(:cat) }
  # 全てが有効な状態であること
  it "is valid with a title, content, images, disease_name, age_range, user_id, cat_id" do
    blog1 = Blog.new(title: "体験記のタイトル", content: "体験記の本文", disease_name: "病名", age_range: 1, user_id: user.id, cat_id: cat.id)
    blog1.images.attach(io: File.open(Rails.root.join("spec", "fixtures", "images", "test.jpg")), filename: "test.jpg", content_type: "image/jpg")
    blog1.valid?
    expect(blog1).to be_valid
  end
  # タイトルがなければ無効な状態であること
  it "is invalid without a title" do
    blog2 = Blog.new(content: "体験記の本文", disease_name: "病名", age_range: 1, user_id: user.id, cat_id: cat.id)
    blog2.valid?
    expect(blog2).not_to be_valid
  end
  # 本文がなければ無効な状態であること
  it "is invalid without a content" do
    blog3 = Blog.new(title: "体験記のタイトル", disease_name: "病名", age_range: 1, user_id: user.id, cat_id: cat.id)
    blog3.valid?
    expect(blog3).not_to be_valid
  end
  # ユーザーidがなければ無効な状態であること
  it "is invalid without a user_id" do
    blog4 = Blog.new(title: "体験記のタイトル", content: "体験記の本文", disease_name: "病名", age_range: 1, cat_id: cat.id)
    blog4.valid?
    expect(blog4).not_to be_valid
  end
end
