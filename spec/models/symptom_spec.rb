require "rails_helper"

RSpec.describe Symptom, type: :model do
  # 全てが有効な状態であること
  it "is valid with a category, detail" do
    symptom = Symptom.new(category: 2, detail: "くしゃみがでる")
    symptom.valid?
    expect(symptom).to be_valid
  end
end
