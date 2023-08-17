require "rails_helper"

RSpec.describe User, type: :system do
  describe "ユーザー登録機能" do
    context "ユーザーが新規登録をした場合" do
      it "ユーザー登録ができる" do
        visit new_user_registration_path
        fill_in "user[name]", with: "なまえ"
        fill_in "user[email]", with: "test1@test.com"
        fill_in "user[password]", with: "password"
        fill_in "user[password_confirmation]", with: "password"
        click_on "ユーザー登録"
        expect(page).to have_content "ユーザー登録が完了しました。"
      end
    end
  end

  describe "ログイン機能" do
    context "ユーザーがログインした場合" do
      it "ログインできる" do
        FactoryBot.create(:user, email: "test@test.com")
        visit new_user_session_path
        fill_in "user[email]", with: "test@test.com"
        fill_in "user[password]", with: "password"
        click_on "ログイン"
        expect(page).to have_content "ログインしました。"
      end
    end
    context "ゲストユーザーがログインした場合" do
      it "ログインできる" do
        visit new_user_session_path
        click_link "ゲストログイン（閲覧用）"
        expect(page).to have_content "ゲストユーザーとしてログインしました。"
      end
    end
    context "ゲスト管理者がログインした場合" do
      it "管理画面に遷移できる" do
        visit new_user_session_path
        click_link "ゲスト管理者ログイン"
        expect(page).to have_content "ゲスト管理者としてログインしました。"
      end
    end
  end

  describe "アカウント管理機能" do
    before do
      user = FactoryBot.create(:user, email: "test@test.com")
      visit new_user_session_path
      fill_in "session[email]", with: "test@test.com"
      fill_in "session[password]", with: "password"
      click_on "ログイン"
    end
    context "ユーザーがアカウント情報を編集した場合" do
      it "更新できる" do
        visit edit_user_registration_path(user.id)
        fill_in "user[introduction]", with: "プロフィールを追加します！"
        click_on "更新"
        expect(page).to have_content "ユーザー情報を変更しました。"
      end
    end
    context "ユーザーがログアウトした場合" do
      it "ログアウトできる" do
        click_on "ログアウト"
        expect(page).to have_content "ログアウトしました。"
      end
    end
    context "ユーザーが退会した場合" do
      it "退会できる" do
        visit cancellation_user_path(user.id)
        click_on "退会する"
        accept_confirm { click_on "OK" }
        expect(page).to have_content "退会処理が完了いたしました。"
      end
    end
  end

  describe "管理画面機能" do
    before do
      admin = FactoryBot.create(:admin_user)
      visit new_user_session_path
      fill_in "session[email]", with: "admintest@test.com"
      fill_in "session[password]", with: "password"
      click_on "ログイン"
    end
    context "管理者が管理画面に遷移した場合" do
      it "管理画面に遷移できる" do
        visit admin_root_path
        expect(page).to have_content "ダッシュボード"
      end
    end
  end

  describe "アクセス制限機能" do
    let!(:user) { FactoryBot.create(:user, email: "test@test.com") }
    context "ログインせずに体験記作成画面に飛ぼうとした場合" do
      it "ログイン画面に遷移し、ログインを促す" do
        visit new_blog_path
        expect(page).to have_content "ログインもしくはアカウント登録してください"
      end
    end
    context "一般ユーザーが管理画面に飛ぼうとした場合" do
      it "遷移できずにHome画面に戻る" do
        visit new_user_session_path
        fill_in "user[email]", with: "test@test.com"
        fill_in "user[password]", with: "password"
        click_on "ログイン"
        visit admin_root_path
        expect(page).to have_content "アクセス権限がありません。"
      end
    end
  end
end
