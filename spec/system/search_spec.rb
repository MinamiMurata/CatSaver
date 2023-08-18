require "rails_helper"

RSpec.describe "症状検索機能", type: :system do
  describe "症状検索" do
    before do
      FactoryBot.create(:breed)
      FactoryBot.create(:symptom)
    end
    context "症状を選択した場合" do
      it "次に進むことができる" do
        visit select_symptom_path
        check "symptom_details[]"
        click_on "次へ"
        expect(page).to have_content "年齢層の選択"
      end
    end
    context "症状を選択しなかった場合" do
      it "次に進むことができない" do
        visit select_symptom_path
        click_on "次へ"
        expect(page).to have_content "症状を１つ以上選択してください。"
      end
    end
    context "症状を選択した後、年齢層・猫種を選択した場合" do
      it "検索結果が表示される" do
        visit select_symptom_path
        check "symptom_details[]"
        click_on "次へ"
        choose "age_range_under_one"
        click_on "次へ"
        select "アビシニアン", from: "breed_name"
        click_on "結果を見る"
        expect(page).to have_content "あなたの回答と関連性のある情報はこちらです。"
      end
    end
    context "症状を選択した後、年齢層・猫種を選択しなかった場合でも" do
      it "検索結果が表示される" do
        visit select_symptom_path
        check "symptom_details[]"
        click_on "次へ"
        expect(page).to have_content "年齢層の選択"
        click_on "次へ"
        expect(page).to have_content "猫種の選択"
        click_on "結果を見る"
        expect(page).to have_content "あなたの回答と関連性のある情報はこちらです。"
      end
    end
  end
end
