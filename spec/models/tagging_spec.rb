require "rails_helper"

RSpec.describe Tagging, type: :model do
  let!(:blog) { FactoryBot.create(:blog) }
  let!(:symptom) { FactoryBot.create(:symptom) }
  # 全てが有効な状態であること
  it "is valid with a blog_id, symptom_id" do
    tagging1 = Tagging.new(blog_id: blog.id, symptom_id: symptom.id)
    tagging1.valid?
    expect(tagging1).to be_valid
  end
  # 体験記idがなければ無効な状態であること
  it "is invalid without a blog_id" do
    tagging2 = Tagging.new(symptom_id: symptom.id)
    tagging2.valid?
    expect(tagging2).not_to be_valid
  end
  # 症状idがなければ無効な状態であること
  it "is invalid without a blog_id" do
    tagging2 = Tagging.new(blog_id: blog.id)
    tagging2.valid?
    expect(tagging2).not_to be_valid
  end
end
