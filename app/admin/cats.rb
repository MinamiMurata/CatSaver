ActiveAdmin.register Cat do
  permit_params :name, :introduction, :image, :birthday, :breed_id, :user_id

  # 一覧ページ
  index do
    selectable_column
    id_column
    column :name
    column :introduction
    column :created_at
    actions
  end

  # 詳細ページ
  show do
    attributes_table do
      row :name
      row :introduction
      row :image do
        image_tag(cat.image.url, class: "main_icon") if cat.image?
      end
      row :birthday
      row :breed
      row :user
      row :created_at
      row :updated_at
    end
    active_admin_comments
  end

  # 一覧ページの検索条件
  filter :name
  filter :breed, as: :select
  filter :created_at

  # 新規作成/編集ページ
  form do |f|
    f.inputs do
      f.input :name
      f.input :introduction
      f.input :image, hint: (f.image_tag(f.cat.image.url, class: "main_icon") if f.cat.image?)
      f.input :image_cache, as: :hidden
      f.input :birthday, as: :date_picker
      f.input :breed
      f.input :user
    end
    f.actions
  end
end
