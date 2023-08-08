# frozen_string_literal: true
ActiveAdmin.register_page "Dashboard" do
  menu priority: 1, label: proc { I18n.t("active_admin.dashboard") }

  content title: proc { I18n.t("active_admin.dashboard") } do
    # div class: "blank_slate_container", id: "dashboard_default_message" do
    #   span class: "blank_slate" do
    #     span I18n.t("active_admin.dashboard_welcome.welcome")
    #     small I18n.t("active_admin.dashboard_welcome.call_to_action")
    #   end
    # end

    columns do
      column do
        panel "インフォメーション" do
          para "現在の登録状況は以下の通りです。"
          ul link_to("Homeへ戻る", root_path)
        end
      end
    end
    columns do
      column do
        panel "ユーザー数" do
          ul { User.count }
        end
      end
      column do
        panel "登録されている猫数" do
          ul { Cat.count }
        end
      end
    end
    columns do
      column do
        panel "体験記投稿数" do
          ul { Blog.count }
        end
      end
    end
    columns do
      column do
        panel "猫種数" do
          ul { Breed.count }
        end
      end
      column do
        panel "登録されている症状タグ数" do
          ul { Symptom.count }
        end
      end
    end
  end
end
