require "rails_helper"

RSpec.describe Breed, type: :model do
  # 全てが有効な状態であること
  it "is valid with a name" do
    breed1 = Breed.new(name: "ノルウェージャンフォレストキャット")
    breed1.valid?
    expect(breed1).to be_valid
  end
  # 名前がなければ無効な状態であること
  it "is invalid without a name" do
    breed2 = Breed.new(id: 2)
    breed2.valid?
    expect(breed2).not_to be_valid
  end
end
