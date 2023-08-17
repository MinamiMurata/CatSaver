require "rails_helper"

RSpec.describe Cat, type: :system do
  describe "猫CRUD機能" do
    before do
      user = FactoryBot.create(:user, email: "test@test.com")
      FactoryBot.create(:cat, user_id: user.id)
      FactoryBot.create(:breed, name: "トイガー")
      visit new_user_session_path
      fill_in "user[email]", with: "test@test.com"
      fill_in "user[password]", with: "password"
      find("div.actions input").click
    end
    context "ユーザーが猫を新規登録をした場合" do
      it "登録ができる" do
        click_on "マイページ"
        click_on "猫の登録"
        fill_in "cat[name]", with: "たま"
        fill_in "cat[introduction]", with: "よろしくにゃ"
        fill_in "cat[birthday]", with: "002022-02-02"
        attach_file "cat[image]", "#{Rails.root}/spec/fixtures/images/test.jpg"
        select "トイガー", from: "cat_breed_id"
        click_on "登録"
        find("div.actions input").click
        expect(page).to have_content "猫を登録しました！"
      end
    end
    context "ユーザーが猫情報を編集した場合" do
      it "更新できる" do
        click_on "マイページ"
        click_on "ねこ"
        click_on "猫情報編集"
        fill_in "cat[introduction]", with: "紹介文を追加します！"
        click_on "更新"
        expect(page).to have_content "猫情報を編集しました！"
      end
    end
    context "ユーザーが猫情報を削除した場合" do
      it "削除できる" do
        click_on "マイページ"
        click_on "削除"
        page.accept_confirm
        expect(page).to have_content "猫情報を削除しました！"
      end
    end
  end

  describe "アクセス制限機能" do
    context "ログインせずに猫登録画面に飛ぼうとした場合" do
      it "ログイン画面に遷移し、ログインを促す" do
        visit new_cat_path
        expect(page).to have_content "ログインもしくはアカウント登録してください"
      end
    end
    context "ユーザーが他のユーザーの猫情報を編集しようとした場合" do
      it "編集できない（Show画面に遷移する）" do
        user1 = FactoryBot.create(:user)
        cat = FactoryBot.create(:cat, user_id: user1.id)
        FactoryBot.create(:second_user, email: "test2@test.com")
        visit new_user_session_path
        fill_in "user[email]", with: "test2@test.com"
        fill_in "user[password]", with: "password"
        find("div.actions input").click
        expect(page).to have_content "ログインしました。"
        visit edit_cat_path(cat.id)
        expect(page).to_not have_content "猫情報の編集"
      end
    end
  end
end
