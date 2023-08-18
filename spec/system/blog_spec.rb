require "rails_helper"

RSpec.describe "体験記管理機能", type: :system do
  describe "体験記CRUD機能" do
    before do
      user = FactoryBot.create(:user, name: "テストさん", email: "test@test.com")
      FactoryBot.create(:cat, user_id: user.id)
      FactoryBot.create(:breed, name: "ベンガル")
      FactoryBot.create(:blog, user_id: user.id)
      visit new_user_session_path
      fill_in "user[email]", with: "test@test.com"
      fill_in "user[password]", with: "password"
      find("div.actions input").click
    end
    context "ユーザーが体験記を新規登録をした場合" do
      it "登録ができる" do
        click_on "マイページ"
        expect(page).to have_content "体験記 投稿"
        click_on "体験記 投稿"
        fill_in "blog[title]", with: "体験記です"
        select "ねこ", from: "blog_cat_id"
        attach_file "blog[images][]", "#{Rails.root}/spec/fixtures/images/test.jpg"
        fill_in "blog[content]", with: "体験記本文です。"
        select "1歳未満", from: "blog_age_range"
        fill_in "blog[disease_name]", with: "体験記の病名"
        select "目", from: "input-select"
        click_on "登録"
        expect(page).to have_content "以下の内容で、投稿しますか？"
        click_on "登録"
        expect(page).to have_content "体験記を投稿しました！"
      end
    end
    context "体験記の詳細画面に遷移した場合" do
      it "体験記の内容が表示される" do
        blog = FactoryBot.create(:blog)
        expect(page).to have_content "ログインしました。"
        visit blog_path(blog.id)
        expect(page).to have_content "テスト体験記のタイトル"
      end
    end
    context "ユーザーが体験記を編集した場合" do
      it "更新できる" do
        expect(page).to have_content "ログインしました。"
        click_on "マイページ"
        click_on "テスト体験記のタイトル"
        click_on "編集"
        attach_file "blog[images][]", "#{Rails.root}/spec/fixtures/images/test.jpg"
        click_on "更新"
        expect(page).to have_content "体験記を編集しました！"
      end
    end
    context "ユーザーが体験記を削除した場合" do
      it "削除できる" do
        expect(page).to have_content "ログインしました。"
        click_on "マイページ"
        click_on "テストさんの体験記一覧へ"
        expect(page).to have_content "テストさんの体験記一覧"
        click_on "削除"
        page.accept_confirm
        expect(page).to have_content "体験記を削除しました！"
      end
    end
  end

  describe "一覧表示・検索機能" do
    before do
      user1 = FactoryBot.create(:user)
      user2 = FactoryBot.create(:second_user)
      breed1 = FactoryBot.create(:breed)
      breed2 = FactoryBot.create(:second_breed)
      cat1 = FactoryBot.create(:cat, user_id: user1.id, breed_id: breed1.id)
      cat2 = FactoryBot.create(:second_cat, user_id: user2.id, breed_id: breed2.id)
      FactoryBot.create(:blog, user_id: user1.id, cat_id: cat1.id)
      FactoryBot.create(:second_blog, user_id: user2.id, cat_id: cat2.id)
      visit blogs_path
    end
    context "一覧画面に遷移した場合" do
      it "作成済みの体験記一覧が表示される" do
        expect(page).to have_content "テスト体験記のタイトル"
      end
    end
    context "検索ワードを入力して検索した場合" do
      it "該当する体験記が表示される" do
        fill_in "q[title_or_content_or_disease_name_or_symptoms_detail_cont]", with: "テスト"
        click_on "　検 索　"
        expect(page).to have_content "テスト"
      end
    end
    context "年齢で絞り込んで検索した場合" do
      it "該当する体験記が表示される" do
        select "1〜3歳", from: "q_age_range_eq"
        click_on "　検 索　"
        expect(page).to have_content "体験記2"
      end
    end
    context "猫種で絞り込んで検索した場合" do
      it "該当する体験記が表示される" do
        select "メインクーン", from: "q_cat_breed_id_eq"
        click_on "　検 索　"
        expect(page).to have_content "体験記2"
      end
    end
    context "検索ワードと年齢で絞り込んで検索をした場合" do
      it "検索ワードを含み、かつ年齢に完全一致する体験記が絞り込まれる" do
        fill_in "q[title_or_content_or_disease_name_or_symptoms_detail_cont]", with: "テスト"
        select "1歳未満", from: "q_age_range_eq"
        click_on "　検 索　"
        expect(page).to have_content "テスト"
      end
    end
    context "検索ワードと猫種で絞り込んで検索をした場合" do
      it "検索ワードを含み、かつ猫種に完全一致する体験記が絞り込まれる" do
        fill_in "q[title_or_content_or_disease_name_or_symptoms_detail_cont]", with: "テスト"
        select "アビシニアン", from: "q_cat_breed_id_eq"
        click_on "　検 索　"
        expect(page).to have_content "テスト"
      end
    end
    context "検索ワードと年齢と猫種で絞り込んで検索をした場合" do
      it "検索ワードを含み、かつ年齢と猫種に完全一致する体験記が絞り込まれる" do
        fill_in "q[title_or_content_or_disease_name_or_symptoms_detail_cont]", with: "体験記"
        select "1〜3歳", from: "q_age_range_eq"
        select "メインクーン", from: "q_cat_breed_id_eq"
        click_on "　検 索　"
        expect(page).to have_content "体験記2"
      end
    end
  end

  describe "アクセス制限機能" do
    context "ログインせずに体験記作成画面に飛ぼうとした場合" do
      it "ログイン画面に遷移し、ログインを促す" do
        visit new_blog_path
        expect(page).to have_content "ログインもしくはアカウント登録してください"
      end
    end
    context "ユーザーが他のユーザーの体験記情報を編集しようとした場合" do
      it "編集できない（Show画面に遷移する）" do
        user1 = FactoryBot.create(:user)
        blog1 = FactoryBot.create(:blog, user_id: user1.id)
        FactoryBot.create(:second_user, email: "test2@test.com")
        visit new_user_session_path
        fill_in "user[email]", with: "test2@test.com"
        fill_in "user[password]", with: "password"
        find("div.actions input").click
        expect(page).to have_content "ログインしました。"
        visit edit_blog_path(blog1.id)
        expect(page).to_not have_content "体験記の編集"
      end
    end
  end
end
